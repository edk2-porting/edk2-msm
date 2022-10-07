#include<errno.h>
#include<fcntl.h>
#include<stdio.h>
#include<stdint.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<sys/mman.h>
#include<sys/stat.h>
#include<sys/sendfile.h>
struct acpi_header{
	uint32_t sign;
	uint32_t len;
	uint8_t  rev;
	uint8_t  checksum;
	char     oemid[6];
	char     oemtableid[8];
	uint32_t oemrev;
	uint32_t creatorid;
	uint32_t creatorrev;
};
int main(int argc,char**argv){
	if(argc!=4){
		fprintf(stderr,"Usage: sosi-patcher <INPUT> <OUTPUT> <SOSI addr>\n");
		return 1;
	}
	char*es=NULL;
	uint64_t val=(uint64_t)strtoll(argv[3],&es,0);
	if(errno!=0||es==argv[3]){
		perror("invalid value");
		return 1;
	}
	printf("target value: 0x%016lX\n",val);
	printf("input file: %s\n",argv[1]);
	printf("output file: %s\n",argv[2]);
	int fdin=open(argv[1],O_RDONLY);
	if(fdin<0){
		perror("open input failed");
		return 1;
	}
	int fdout=open(argv[2],O_RDWR|O_CREAT|O_TRUNC,0644);
	if(fdout<0){
		perror("open output failed");
		close(fdin);
		return 1;
	}
	struct stat st;
	if(fstat(fdin,&st)<0){
		perror("fstat failed");
		close(fdin);
		close(fdout);
		return 1;
	}
	if(st.st_size<=16){
		fprintf(stderr,"input file too small\n");
		close(fdin);
		close(fdout);
		return 1;
	}
	printf("file size: %zu bytes\n",st.st_size);
	ssize_t r=sendfile(fdout,fdin,0,st.st_size);
	if(r<0||(size_t)r!=(size_t)st.st_size){
		perror("sendfile failed");
		close(fdin);
		close(fdout);
		return 1;
	}
	fdatasync(fdout);
	void*addr=mmap(NULL,st.st_size,PROT_READ|PROT_WRITE,MAP_SHARED,fdout,0);
	if(addr==MAP_FAILED||!addr){
		perror("mmap failed");
		close(fdin);
		close(fdout);
		return 1;
	}
	struct acpi_header*header=addr;
	char*pos=addr,oldsum=header->checksum,sum=0;
	uint32_t size=header->len;
	printf(
		"acpi sign: \"%.*s\"\n",
		(int)sizeof(header->sign),(char*)&header->sign
	);
	printf("acpi rev: 0x%08x\n",header->rev);
	printf("acpi len: %d bytes\n",size);
	printf("acpi checksum: %02X\n",oldsum);
	printf(
		"acpi oem id: \"%.*s\" tableid: \"%.*s\" rev: 0x%08x\n",
		(int)sizeof(header->oemid),header->oemid,
		(int)sizeof(header->oemtableid),header->oemtableid,
		header->oemrev
	);
	printf(
		"acpi creator id: \"%.*s\" rev: 0x%08x\n",
		(int)sizeof(header->creatorid),(char*)&header->creatorid,
		header->creatorrev
	);
	header->checksum=0;
	while((size--)!=0)sum=(uint8_t)(sum+(*pos++));
	sum=(uint8_t)(0xFF-sum+1);
	printf("current checksum: %02X\n",sum);
	if(header->len!=st.st_size)
		printf("warning: acpi length mismatch\n");
	if(sum!=oldsum)
		printf("warning: acpi checksum mismatch\n");
	pos=addr;
	for(size_t s=0;s<(size_t)st.st_size-16;s++,pos++){
		if(strncmp(pos,"SOSI",4)!=0)continue;
		printf("found SOSI at 0x%08zX\n",s);
		uint64_t*value=(uint64_t*)&pos[5];
		printf("old value: 0x%016lx\n",*value);
		*value=val;
		printf("new value: 0x%016lx\n",*value);
		break;
	}
	pos=addr,size=header->len,header->checksum=0;
	while((size--)!=0)sum=(uint8_t)(sum+(*pos++));
	sum=(uint8_t)(0xFF-sum+1);
	printf("new checksum: %02X\n",sum);
	header->checksum=sum;
	munmap(addr,st.st_size);
	fdatasync(fdout);
	close(fdin);
	close(fdout);
	printf("done\n");
	return 0;
}

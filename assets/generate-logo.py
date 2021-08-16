#!/usr/bin/python3

import time
ohmydate = str(time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()))

import sys
pwd = sys.path[0]

import PIL
from PIL import ImageFont
from PIL import Image
from PIL import ImageDraw
from git import Repo


imageFile = pwd + "/Logo.bmp"
file_save_dir = pwd + "/../sdm845Pkg/Drivers/LogoDxe/"
outputName = "Logo"
print(ohmydate)

repoPath = pwd + "/.."
repo = Repo(repoPath)
gitHead = str(repo.head.commit)
gitHead = gitHead[0:7]
print(gitHead)
strs = " version: " + str(sys.argv[1]) + "\n Build: " + ohmydate


x = 410
y = 250
word_size = 40
word_css  = pwd + "/NotoSerif-Italic.ttf"

#Set font
font = ImageFont.truetype(word_css,word_size)

im1=Image.open(imageFile)
draw = ImageDraw.Draw(im1)
print(font.getsize(strs))
# draw.text((x, y),strs,(255,255,0),font=font)

new_filename = file_save_dir  +outputName.replace(",","-").replace("\n","-")+".bmp"
im1.save(new_filename)
del draw
im1.close()

FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install build-essential uuid-dev iasl nasm gcc-aarch64-linux-gnu abootimg python3-distutils python3-pil python3-git gettext locales wine \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen en_US.UTF-8
ENV LANG en_US.utf8
WORKDIR /build
COPY . .

CMD ["/bin/bash"]

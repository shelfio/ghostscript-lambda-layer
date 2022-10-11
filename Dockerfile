FROM lambci/lambda-base-2:build
ENV GS_TAG=gs9561
ENV GS_VERSION=9.56.1

RUN yum install -y wget

RUN mkdir /usr/local/src/ghostscript && \
  cd /usr/local/src/ghostscript && \
  wget -qO - https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/$GS_TAG/ghostscript-$GS_VERSION.tar.gz | tar -zxf - && \
  cd ghostscript-$GS_VERSION && \
  ./configure --without-luratech && \
  make && make install

RUN cd /usr/local && \
  zip /tmp/gs.zip bin/gs

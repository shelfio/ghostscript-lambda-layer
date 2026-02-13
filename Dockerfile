ARG BASE_IMAGE

FROM ${BASE_IMAGE}

ARG GS_VERSION
ARG GS_TAG

RUN yum install -y wget tar xz zip gcc make

RUN echo "Building Ghostscript version: $GS_VERSION (tag: $GS_TAG)" && \
  mkdir /usr/local/src/ghostscript && \
  cd /usr/local/src/ghostscript && \
  wget -qO - https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/$GS_TAG/ghostscript-$GS_VERSION.tar.xz | tar -Jxf - && \
  cd ghostscript-$GS_VERSION && \
  ./configure --without-luratech && \
  make && make install

RUN cd /usr/local && \
  zip /tmp/gs.zip bin/gs

FROM amazonlinux:2
ARG PY_VERSION=3.8.1

# System dependencies
RUN yum install -y \
  gcc-c++ \
  libffi-devel \
  make \
  openssl-devel \
  tar \
  xz \
  zip

# Install python
RUN curl https://www.python.org/ftp/python/${PY_VERSION}/Python-${PY_VERSION}.tar.xz | tar -xJ \
 && cd Python-${PY_VERSION} \
 && ./configure --prefix=/usr/local --enable-shared \
 && make && make install \
 && cd .. && rm -rf Python-${PY_VERSION}
ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# Upgrade pip
RUN pip3 install --upgrade pip

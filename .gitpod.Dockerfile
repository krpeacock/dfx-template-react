FROM gitpod/workspace-full

RUN sudo apt-get update
RUN sudo apt-get install -y vim tree curl build-essential make gcc sudo less git rsync
RUN sudo apt-get clean

# DFX
RUN wget https://sdk.dfinity.org/install.sh -O /tmp/install-sdk.sh \
 && sh -c 'yes Y | DFX_VERSION=0.8.0 sh /tmp/install-sdk.sh'
RUN export PATH=/home/gitpod/bin/:$PATH

# Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

COPY ./files/. .


FROM ubuntu:latest

LABEL MAINTAINER "Quint Daenen <me@di-wu.be>"
LABEL SOURCE "https://github.com/aviate-labs/workspace"

RUN apt-get update
RUN apt-get install -y vim tree curl build-essential make gcc sudo less git rsync
RUN apt-get clean

# DFX
RUN echo y | sh -ci "$(curl -fsSL https://sdk.dfinity.org/install.sh)"
RUN chmod +x /usr/local/bin/dfx
RUN export PATH=/home/gitpod/bin/:$PATH

# NVM & Node
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
ENV NVM_DIR /root/.nvm
RUN . $NVM_DIR/nvm.sh && nvm install stable

# Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

RUN dfx start --background --clean

COPY ./files/. .

ENTRYPOINT ["sh","/setup.sh"]

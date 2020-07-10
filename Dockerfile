FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y ngrep curl protobuf-compiler mysql-client

# Download julia
RUN mkdir -p /usr/local/julia && \
    cd /usr/local/julia && \
    curl -Lo julia.tar.gz https://julialang-s3.julialang.org/bin/linux/x64/1.4/julia-1.4.2-linux-x86_64.tar.gz && \
    tar xf julia.tar.gz && \
    rm julia.tar.gz && \
    ln -s /usr/local/julia/julia-1.4.2/bin/julia /usr/bin/ && \
    julia -e 'using Pkg; Pkg.pkg"add ProtoBuf@0.8.0"'

COPY . /mysqlx

WORKDIR /mysqlx

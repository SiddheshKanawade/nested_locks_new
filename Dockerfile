FROM  ocaml/opam2:ubuntu-lts

RUN sudo apt-get update && sudo apt-get -y install ocaml-findlib ocamlbuild

COPY . /app
WORKDIR /app/cil-develop
RUN sudo bash ./configure && sudo make && sudo make install

RUN sudo apt-get update -y 
RUN sudo apt-get install -y time

RUN sudo apt update 
RUN sudo apt-get -y install lp-solve 
RUN sudo apt-get install -y wget
RUN sudo apt-get update -y
RUN sudo apt-get install -y gcc-arm-none-eabi
RUN sudo apt-get update -y
RUN sudo apt-get install -y libc6-i386
#ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
RUN  sudo apt-get install -y libxml2-dev 
WORKDIR /app/heptane_svn
RUN sudo git clone https://github.com/doxygen/doxygen.git
WORKDIR /app/heptane_svn/doxygen
RUN sudo mkdir build
WORKDIR /app/heptane_svn/doxygen/build
RUN sudo apt-get -y install cmake 
RUN sudo apt-get -y install graphviz 
RUN sudo apt-get -y install flex 
RUN sudo apt-get -y install bison 
RUN sudo cmake -G "Unix Makefiles" ..
RUN sudo make
RUN sudo make install
WORKDIR /app/heptane_svn
RUN sudo ./install.sh | echo "y" | echo "y"

WORKDIR /data

VOLUME ["/data"]


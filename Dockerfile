FROM ubuntu
USER root
RUN apt-get install software-properties-common --assume-yes
RUN add-apt-repository ppa:george-edison55/cmake-3.x
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get update
RUN apt-get install git cmake make build-essential zlib1g-dev libmysqlclient-dev g++-5 gcc-5 --assume-yes
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 20
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 20
RUN update-alternatives --config gcc
RUN update-alternatives --config g++
RUN git clone https://github.com/pvpgn/pvpgn-server.git
RUN cd pvpgn-server && ls
RUN mkdir pvpgn-build
RUN cd pvpgn-build && cmake CMAKE_INSTALL_PREFIX=/user/local/pvpgn ../pvpgn-server && make install
RUN /usr/local/sbin/bnetd
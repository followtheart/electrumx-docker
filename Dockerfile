FROM ubuntu:14.04

RUN sudo apt-get update \
    && sudo apt-get install -y software-properties-common -y \
    && sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test \
    && sudo add-apt-repository -y ppa:jonathonf/python-3.6 \
    && sudo apt-get update \
    && sudo apt-get install -y python3.6 python3.6-dev libleveldb-dev git \
    && sudo apt-get install -y wget gcc-4.9 gcc-4.9-dev g++-4.9 \
    && sudo apt-get install -y libssl-dev daemontools nano build-essential \
    && sudo apt-get purge -y python \
    && sudo rm /usr/bin/x86_64-linux-gnu-gcc \
    && sudo ln -s /usr/bin/gcc-4.9 /usr/bin/x86_64-linux-gnu-gcc \
    && sudo rm /usr/bin/x86_64-linux-gnu-g++ \
    && sudo ln -s /usr/bin/g++-4.9 /usr/bin/x86_64-linux-gnu-g++ \
    && sudo rm /usr/bin/python3 \
    && sudo ln -s /usr/bin/python3.6 /usr/bin/python3 \
    && wget https://bootstrap.pypa.io/get-pip.py -O- | python3.6 \
    && pip install scrypt 

RUN sudo groupadd -r electrumx \
    && useradd -s /bin/bash -m -g electrumx electrumx \
    && cd /home/electrumx && pwd \
    && git clone https://github.com/kyuupichan/electrumx.git \
    && chown -R electrumx:electrumx electrumx && cd electrumx \
    && python3.6 setup.py install
    
USER electrumx

RUN cd ~ && pwd \
    && mkdir -p ~/db ~/log ~/service ~/scripts/electrumx \
    && cp -R ~/electrumx/contrib/daemontools/* ~/scripts/electrumx \
    && chmod +x ~/scripts/electrumx/run \
    && chmod +x ~/scripts/electrumx/log/run \
    && sed -i '$d' ~/scripts/electrumx/log/run \
    && sed -i '$a\exec multilog t s500000 n10 ~/log' ~/scripts/electrumx/log/run  

COPY env/* /home/electrumx/scripts/electrumx/env/

RUN cat ~/scripts/electrumx/env/coins.py >> ~/electrumx/lib/coins.py \
    && ln -s ~/scripts/electrumx  ~/service/electrumx

CMD ["bash","-c","svscan ~/service"]



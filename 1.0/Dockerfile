FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

COPY sources.list /etc/apt/

RUN apt-get clean &&\
    apt-get update && \
    apt-get -f install -y && \ 
    apt-get install -y build-essential   \
                       cmake             \
                       git-core          \
                       python-pip        \
                       python-dev        \
                       vim               \
                       wget              \  
                       libsndfile-dev    \
                       net-tools         \
                       curl            &&\
    rm -rf /var/lib/apt/lists

RUN git config --global http.postBuffer 524288000 && \
    git config --list

ENV GIT_TRACE=1 


RUN git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe --depth=1 

RUN apt-get update && apt-get upgrade -y && apt-get install -y git 

RUN cd ~/.vim/bundle/YouCompleteMe && \
    git submodule update --init 

RUN cd ~/.vim/bundle/YouCompleteMe/third_party/ycmd && \ 
   git submodule update --init 

RUN cd ~/.vim/bundle/YouCompleteMe && \ 
    python ./install.py --clang-completer 





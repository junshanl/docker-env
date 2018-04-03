FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

COPY sources.list /etc/apt/

RUN apt-get clean &&\
    apt-get update && \
    apt-get -f install -y && \ 
    apt-get install -y build-essential   \
                       cmake             \
                       git               \
                       python-pip        \
                       python-dev        \
                       vim               \
                       wget              \  
                       libsndfile-dev    \
                       net-tools         \
                       stunnel4          \   
                       curl            &&\
    rm -rf /var/lib/apt/lists



RUN mkdir -p ~/.pip &&\
    mkdir -p ~/workspace &&\
    mkdir -p ~/.vim/colors

COPY .vimrc /root/
COPY pip.conf /root/.pip
COPY solarized.vim /root/.vim/colors

RUN export TERM=xterm-256color 


RUN git config --global http.postBuffer 524288000 && \
    git config --list

RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

RUN git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe --depth 1


ENV GIT_TRACE_PACKET=1
ENV GIT_TRACE=1
ENV GIT_CURL_VERBOSE=1

RUN git config --list && \
    cd $HOME/.vim/bundle/YouCompleteMe && \
    git submodule sync && \
    git submodule update --init --depth=1 --recursive && \
    python ./install.py --clang-completer 


RUN vim +'se hidden' +BundleInstall +qall
 
RUN RUN pip install --upgrade pip && \
    pip install tensorflow && \
    pip install glob2 && \
    pip install soundfile && \
    pip install python_speech_features &&\
    pip install scipy && \
    pip install tqdm && \
    pip install pandas &&\
    pip install pyxdg 




FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir -p ~/.pip &&\
    mkdir -p ~/workspace
    mkdir -p ~/.vim/colors

COPY sources.list /etc/apt/
COPY .vimrc /root/
COPY pip.conf /root/.pip
COPY solarized.vim /root/.vim/colors

RUN export TERM=xterm-256color 
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y && \
    apt-get -f install -y && \ 
    apt-get install -y build-essential   \
                       cmake             \
                       git               \
                       python-pip        \
                       python-dev        \
                       vim               \
                       wget              \  
                       libsndfile-dev  && \
    rm -rf /var/lib/apt/lists


RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
RUN vim +PluginInstall +qall

RUN cd $HOME/.vim/bundle/YouCompleteMe && \
    git submodule update --init --recursive && \
    python ./install.py --clang-completer 

RUN pip install --upgrade pip && \
    pip install tensorflow && \
    pip install glob2 && \
    pip install soundfile && \
    pip install python_speech_features &&\
    pip install scipy && \
    pip install tqdm && \
    pip install pandas &&\
    pip install pyxdg 




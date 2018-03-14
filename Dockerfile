FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update                          && \
    apt-get install -y build-essential   \
                       cmake             \
                       git               \
                       python-dev        \
                       silversearcher-ag \
                       vim               \
                       wget                 && \
    rm -rf /var/lib/apt/lists


RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
COPY .vimrc /root/
RUN vim +PluginInstall +qall
 

RUN	cd $HOME/.vim/bundle/YouCompleteMe &&\
    git submodule update --init --recursive &&\
    ./install.sh --clang-completer



FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

COPY sources.list /etc/apt/

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
                       wget                 && \
    rm -rf /var/lib/apt/lists


RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
COPY .vimrc /root/
RUN vim +PluginInstall +qall
 

RUN cd $HOME/.vim/bundle/YouCompleteMe && \
    git submodule update --init --recursive && \
    python ./install.py --clang-completer 


Run pip install --upgrade -i https://pypi.tuna.tsinghua.edu.cn/simple && \
    tensorflow && \
    glob2 



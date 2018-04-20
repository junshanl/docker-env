FROM junshanl/ubuntu:1.0

RUN  mkdir -p ~/.vim/autoload  && \
     curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

RUN git clone https://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized

RUN git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
RUN git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
RUN git clone https://github.com/vim-scripts/indentpython.vim ~/.vim/bundle/identpython
RUN git clone https://github.com/Yggdroot/indentLine ~/.vim/bundle/indentLine
RUN pip install autopep8 && \
    git clone https://github.com/tell-k/vim-autopep8 ~/.vim/bundle/vim-autopepu
RUN git clone https://github.com/vim-syntastic/syntastic ~/.vim/bundle/syntastic

RUN mkdir /root/.pip


RUN pip install --upgrade pip
RUN pip install flake8
COPY pip.conf /root/.pip

RUN pip install tensorflow && \
    pip install glob2 && \
    pip install soundfile && \
    pip install python_speech_features &&\
    pip install scipy && \
    pip install tqdm && \
    pip install pandas &&\
    pip install pyxdg 
    
RUN pip install librosa

RUN git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp 
RUN apt-get install silversearcher-ag && \ 
    git clone https://github.com/rking/ag.vim.git ~/.vim/bundle/ag

RUN apt-get update && \
    apt-get install -y ffmpeg
RUN apt-get install -y vim-gtk
Run git clone https://github.com/skywind3000/asyncrun.vim ~/.vim/bundle/asyncrun

# make /bin/sh symlink to bash instead of dash:
RUN echo "dash dash/sh boolean false" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash

RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:jonathonf/vim && \
    apt-get update && \
    apt-get install -y vim

RUN git clone https://github.com/vim-scripts/Super-Shell-Indent ~/.vim/bundle/Super-Shell-Indent

COPY .vimrc /root/

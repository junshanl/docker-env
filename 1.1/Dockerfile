FROM junshanl/ubuntu:1.0

RUN  mkdir -p ~/.vim/autoload  && \
     curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

RUN git clone https://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized

RUN git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
RUN git clone https://github.com/Lokaltog/vim-powerline ~/.vim/bundle/powerline
RUN git clone https://github.com/vim-scripts/indentpython.vim ~/.vim/bundle/identpython
RUN git clone https://github.com/Yggdroot/indentLine ~/.vim/bundle/indentLine
RUN pip install autopep8 && \
    git clone https://github.com/tell-k/vim-autopep8 ~/.vim/bundle/vim-autopepu
RUN git clone https://github.com/vim-syntastic/syntastic ~/.vim/bundle/syntastic

RUN mkdir /root/.pip
COPY pip.conf /root/.pip

RUN pip install --upgrade pip && \
    pip install flake8
#RUN apt-get install ctags


RUN pip install tensorflow && \
    pip install glob2 && \
    pip install soundfile && \
    pip install python_speech_features &&\
    pip install scipy && \
    pip install tqdm && \
    pip install pandas &&\
    pip install pyxdg


COPY .vimrc /root/

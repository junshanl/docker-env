FROM junshanl/ubuntu:1.1 

RUN apt-add-repository ppa:ubuntu-audio-dev/alsa-daily && \
    apt-get update && \
    apt-get install -y linux-image-extra-`uname -r`
    
RUN apt-get install -y alsa-base alsa-utilsi python-pyauido

RUN pip install pyaudio


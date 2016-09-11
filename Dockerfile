FROM codingwell/rpi-raspbian-omxplayer-buildenv

RUN [ "cross-build-start" ]

WORKDIR /usr/src
RUN git clone https://github.com/tsuckow/omxplayer.git
WORKDIR /usr/src/omxplayer

RUN ./prepare-native-raspbian.sh

RUN make ffmpeg -j3
RUN mv ffmpeg_compiled ../
WORKDIR /usr/src
RUN rm -rf /usr/src/omxplayer

RUN [ "cross-build-end" ]
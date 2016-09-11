FROM codingwell/rpi-raspbian-omxplayer-buildenv

RUN [ "cross-build-start" ]

WORKDIR /usr/src
RUN git clone https://github.com/tsuckow/omxplayer.git
WORKDIR /usr/src/omxplayer

RUN ./prepare-native-raspbian.sh

RUN make ffmpeg -j3
RUN [ "cross-build-end" ]
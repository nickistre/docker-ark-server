# steamcmd run as user daemon
# https://developer.valvesoftware.com/wiki/SteamCMD#Linux 

FROM crosbymichael/steamcmd
MAINTAINER Nicholas Istre

WORKDIR /home/daemon/steamcmd
USER root

RUN apt-get install -y sudo

EXPOSE 27015/udp 
EXPOSE 7777/udp 
EXPOSE 32330

ADD update.txt /home/daemon/steamcmd/update.txt
ADD run-ark-server.sh /home/daemon/steamcmd/run-ark-server.sh
RUN chmod +x ./run-ark-server.sh

USER daemon

ENV ARKSERVER_NAME=Zitch_test
ENV ARKSERVER_PASSWORD=password
ENV ARKSERVER_ADMINPASSWORD=adminpassword

VOLUME /game-data

CMD ./run-ark-server.sh
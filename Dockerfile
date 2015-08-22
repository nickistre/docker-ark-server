# steamcmd run as user daemon
# https://developer.valvesoftware.com/wiki/SteamCMD#Linux 

FROM crosbymichael/steamcmd
MAINTAINER Nicholas Istre

WORKDIR /home/daemon/steamcmd
USER root

ENV ARKSERVER_NAME=Zitch_test
ENV ARKSERVER_PASSWORD=password
ENV ARKSERVER_ADMINPASSWORD=adminpassword

EXPOSE 27015/udp 
EXPOSE 7777/udp 
EXPOSE 32330

ADD update.txt /home/daemon/steamcmd/update.txt
ADD run-ark-server.sh /home/daemon/steamcmd/run-ark-server.sh
RUN chmod +x ./run-ark-server.sh

RUN mkdir -p /home/daemon/steamcmd/ark
RUN chown daemon:daemon /home/daemon/steamcmd/ark

VOLUME /home/daemon/steamcmd/ark

USER daemon

CMD ./run-ark-server.sh
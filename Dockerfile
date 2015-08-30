# steamcmd run as user daemon
# https://developer.valvesoftware.com/wiki/SteamCMD#Linux 

FROM crosbymichael/steamcmd
MAINTAINER Nicholas Istre

WORKDIR /home/daemon/steamcmd
USER root

RUN apt-get install -y sudo

EXPOSE 27015/udp 
EXPOSE 7778/udp 
EXPOSE 32330

ADD update.txt /home/daemon/steamcmd/update.txt
ADD update.sh /usr/local/bin/update
RUN chmod +x /usr/local/bin/update

USER daemon

VOLUME /game-data

WORKDIR /game-data/ark

CMD ["/game-data/ark/ShooterGame/Binaries/Linux/ShooterGameServer","TheIsland?listen?RCONEnabled=True?RCONPort=32330","-server","-log"]
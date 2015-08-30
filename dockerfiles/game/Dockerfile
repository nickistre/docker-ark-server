# steamcmd run as user daemon
# https://developer.valvesoftware.com/wiki/SteamCMD#Linux 

FROM ubuntu:15.04
MAINTAINER Nicholas Istre <nickistre@gmail.com>

WORKDIR /home/daemon/steamcmd
USER root

VOLUME /game-data

RUN apt-get install -y sudo

RUN apt-get update && apt-get install --no-install-recommends -y \
    ca-certificates \
    lib32gcc1 \
    net-tools \
    lib32stdc++6 \
    lib32z1 \
    lib32z1-dev \
    curl

EXPOSE 27015/udp 
EXPOSE 7778/udp 
EXPOSE 32330

# Setup install script (needed for steamcmd setup)
ADD scripts/install.sh /usr/local/bin/install
RUN chmod +x /usr/local/bin/install

# Setup update script
ADD scripts/update.sh /usr/local/bin/update
RUN chmod +x /usr/local/bin/update

# Setup update and install scripts
ADD scripts/validate.sh /usr/local/bin/validate
RUN chmod +x /usr/local/bin/validate

USER daemon

WORKDIR /game-data/ark
ENV ARKSERVER_ADMINPASSWORD "changeme"


CMD ["/game-data/ark/ShooterGame/Binaries/Linux/ShooterGameServer","TheIsland?listen?RCONEnabled=True?RCONPort=32330?ServerAdminPassword=${ARKSERVER_ADMINPASSWORD}","-server","-log"]
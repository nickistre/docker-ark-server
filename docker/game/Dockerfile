# steamcmd run as user daemon
# https://developer.valvesoftware.com/wiki/SteamCMD#Linux 

FROM ubuntu:15.04
MAINTAINER Nicholas Istre <nickistre@gmail.com>

RUN apt-get update

WORKDIR /home/daemon/steamcmd
USER root

VOLUME /game-data

RUN apt-get install --no-install-recommends -y \
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

# Setup scripts
ADD scripts/* /usr/local/bin/
RUN ln -s /usr/local/bin/validate.sh /usr/local/bin/install.sh && chmod +rx /usr/local/bin/* && for file in /usr/local/bin/*.sh; do ln -s ${file} /usr/local/bin/$(basename ${file} .sh); done

USER daemon

# The following variables should be changed.
ENV ARKSERVER_ADMINPASSWORD "changeme"

# The following variables can optionally be changed if needed.
ENV REPEAT_MAX_COUNT 5

# The following variables shouldn't be changed
ENV STEAMCMD_DIR /game-data/steamcmd
ENV ARKSERVER_DIR /game-data/ark

CMD run
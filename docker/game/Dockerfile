# steamcmd run as user daemon
# https://developer.valvesoftware.com/wiki/SteamCMD#Linux 

FROM ubuntu:15.04
MAINTAINER Nicholas Istre <nickistre@gmail.com>

RUN apt-get update

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

# Setup and use daemon user
RUN mkdir -p /home/daemon && chown -R daemon:daemon /home/daemon

USER daemon

# The following variables should be changed.
ENV ARKSERVER_ADMINPASSWORD "changeme"

# The following variables can optionally be changed if needed.
ENV REPEAT_MAX_COUNT 5

# The following variables shouldn't be changed
ENV STEAMCMD_DIR /home/daemon/steamcmd
ENV ARKSERVER_DIR /game-data/ark
ENV LOG_DIR /game-data/logs

# Install steamcmd in image
RUN mkdir -p ${STEAMCMD_DIR} && curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -v -C ${STEAMCMD_DIR} -zx

# Default work directory
WORKDIR /home/daemon/steamcmd

# Default command to do
CMD run
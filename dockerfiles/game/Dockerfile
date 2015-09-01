# steamcmd run as user daemon
# https://developer.valvesoftware.com/wiki/SteamCMD#Linux 

FROM ubuntu:15.04
MAINTAINER Nicholas Istre <nickistre@gmail.com>

WORKDIR /home/daemon/steamcmd
USER root

VOLUME /game-data

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

# Setup install and run scripts (needed for steamcmd setup)
ADD scripts/install-steamcmd.sh /usr/local/bin/install-steamcmd
ADD scripts/run-steamcmd.sh /usr/local/bin/steamcmd
RUN chmod +rx /usr/local/bin/install-steamcmd /usr/local/bin/steamcmd

# Setup update script
ADD scripts/update.sh /usr/local/bin/update
RUN chmod +rx /usr/local/bin/update

# Setup update and install scripts
ADD scripts/validate.sh /usr/local/bin/validate
RUN chmod +rx /usr/local/bin/validate && ln -s /usr/local/bin/validate /usr/local/bin/install

# Setup run script
ADD scripts/run.sh /usr/local/bin/run
RUN chmod +rx /usr/local/bin/run

USER daemon

# The following variables should be changed.
ENV ARKSERVER_ADMINPASSWORD "changeme"

# The following variables can optionally be changed if needed.
ENV REPEAT_MAX_COUNT 5

# The following variables shouldn't be changed
ENV STEAMCMD_DIR /game-data/steamcmd
ENV ARKSERVER_DIR /game-data/ark

CMD run
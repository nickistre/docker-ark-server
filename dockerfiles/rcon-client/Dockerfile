# rcon client docker
# See: http://www.ark-survival.net/en/2015/07/09/rcon-tutorial/

FROM ubuntu:14.04
MAINTAINER Nicholas Istre <nickistre@gmail.com>

# Install gcc
RUN apt-get update -y
RUN apt-get install -y build-essential

ADD http://www.dopefish.de/files/rcon.c rcon.c
RUN gcc -o rcon rcon.c
RUN mv rcon /usr/local/bin

ENV ARKSERVER_ADMINPASSWORD "changeme"

# The following variables are normally not changed

#ENTRYPOINT ["rcon", "-P${ARKSERVER_ADMINPASSWORD}", "-a${GAME_PORT_32330_TCP_ADDR}", "-p${GAME_PORT_32330_TCP_PORT}"]
CMD listplayers
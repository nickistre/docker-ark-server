# docker-ark-server
Running an Ark: Survival Evolved dedicated server in Ark

## Using docker

First, build the image while in the folder with Dockerfile with:

    docker build -t <tag-name> .

Then setup and start the container with (Use your own information for angle-bracketed sections):

    docker run \
        -p 27015:27015/udp -p 7777:7778/udp \
        -v <ark-server-dir>:/game-data \
        -e "ARKSERVER_NAME=<name>" \
        -e "ARKSERVER_PASSWORD=<game-password> \
        -e "ARKSERVER_ADMINPASSWORD=<admin-password>" \
        -d --restart on-failure \
        --name <container-name>
        <tag-name>

Start in interactive mode by replacing `-d` with `-ti`

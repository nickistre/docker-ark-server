# docker-ark-server
Running an Ark: Survival Evolved dedicated server in Ark

## Using docker

First, build the image while in the folder with Dockerfile with (use the tag name you want to use for <tag-name>:

    docker build -t <tag-name> .

Then setup and start the container with (Use your own information for angle-bracketed sections):

    docker run \
        -p 22015:22015/udp -p 7777:7777/udp 32330:32330/tcp \
        -v <ark-server-dir>:/game-data \
        -e "ARKSERVER_NAME=<name>" \
        -e "ARKSERVER_PASSWORD=<game-password> \
        -e "ARKSERVER_ADMINPASSWORD=<admin-password>" \
        -d \
        --name <container-name>
        <tag-name>

Start in interactive mode by replacing `-d` with `-ti`

#!/bin/sh

#echo http_proxy:${http_proxy}
#echo https_proxy:${https_proxy}
#
#docker build --no-cache=true\
#    --build-arg http_proxy=${http_proxy}\
#    --build-arg https_proxy=${https_proxy}\
#    -t k-ishigaki/reverse-proxy\
#    .
#
#docker run --rm\
#    --env http_proxy=${http_proxy}\
#    --env https_proxy=${https_proxy}\
#    -it k-ishigaki/reverse-proxy\
#    bash

docker build --no-cache=true\
    -t k-ishigaki/reverse-proxy\
    .

docker run --rm\
    -p 8888:8888 --name reverse-proxy\
    -it k-ishigaki/reverse-proxy\
    bash


#docker run --rm\
#    -d -p 8888:8888 --name foward-proxy-server\
#    -it k-ishigaki/reverse-proxy\
#    bash

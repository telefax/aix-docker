FROM alpine:latest
MAINTAINER variousdiscordianpopes
RUN apk add --no-cache qemu-system-ppc64
ADD entrypoint.sh /
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

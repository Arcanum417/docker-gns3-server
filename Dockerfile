FROM jsimonetti/alpine-edge:latest

# Install the magic wrapper.
ADD ./start.sh /start.sh
ADD ./config.ini /config.ini

RUN mkdir /data && \
    apk add --no-cache dnsmasq cpulimit docker dynamips py3-pip gns3-server qemu-img qemu-system-x86_64 ubridge vpcs iouyap wget xvfb x11vnc && \
    wget -O requirements.txt https://raw.githubusercontent.com/Arcanum417/docker-gns3-server/master/requirements.txt  && \
    pip3 install -r requirements.txt && \
    wget -O /usr/bin/vpcs https://github.com/GNS3/vpcs/releases/download/v0.8beta1/vpcs

CMD [ "/start.sh" ]

WORKDIR /data

VOLUME ["/data"]


FROM starase/base
MAINTAINER Paolo De Michele <paolo@starase.com>


RUN apt-get install software-properties-common -y \
    && add-apt-repository ppa:transmissionbt/ppa || true
RUN apt-get update \
    && apt-get install transmission-cli transmission-common transmission-daemon net-tools -y

RUN mkdir -p /etc/starase
COPY zsh.sh /etc/starase/zsh.sh
RUN chmod +x /etc/starase/zsh.sh \
    && /bin/bash /etc/starase/zsh.sh

COPY transmission.conf /etc/supervisor/conf.d/transmission.conf

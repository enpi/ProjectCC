FROM ubuntu:latest
MAINTAINER Hans Manuel Grenner Noguerón <juanmagnc@gmail.com>  Version: 1.1

#Instalar Python con todas las dependencias

RUN apt-get update
RUN apt-get -y install python python-setuptools build-essential python-dev
RUN easy_install pip

# Instalamos MongoDB

RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list && \
  apt-get update && \
  apt-get install -y mongodb-org && \
  rm -rf /var/lib/apt/lists/*

# Instalar wget para descargar y zip para descomprimir

RUN apt-get install -y wget

# Instalamos git y clonamos el repositorio

RUN apt-get install -y git
RUN git clone https://github.com/enpi/ProjectCC.git

# Instalamos las dependencias del proyecto

RUN easy_install web.py
RUN easy_install mako
RUN easy_install pymongo
RUN wget https://pypi.python.org/packages/source/f/feedparser/feedparser-5.2.1.tar.gz#md5=d552f7a2a55e8e33b2a3fe1082505b42 && \ 
tar -xvzf feedparser-5.2.1.tar.gz && \
cd feedparser-5.2.1 && \
python setup.py install && \
cd ..
RUN easy_install tweepy

# Lanzamos la aplicación

RUN cd ProjectCC && \
python script.py

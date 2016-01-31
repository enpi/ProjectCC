FROM ubuntu:latest
MAINTAINER Hans Manuel Grenner Noguerón <juanmagnc@gmail.com>  Version: 1.1

#Instalar Python con todas las dependencias

RUN apt-get update
RUN apt-get -y install python python-setuptools mongodb build-essential python-dev
RUN apt-get install -y python-setuptools
RUN easy_install pip

# Instalar wget para descargar y zip para descomprimir

RUN apt-get install -y wget


# Instalamos git y clonamos el repositorio

RUN apt-get install -y git
RUN git clone https://github.com/enpi/ProjectCC.git

# Instalamos las dependencias del proyecto

RUN easy_install web.py
RUN easy_install mako
RUN easy_install pymongo
RUN wget https://pypi.python.org/packages/source/f/feedparser/feedparser-5.2.1.tar.gz#md5=d552f7a2a55e8e33b2a3fe1082505b42
&& tar -xvzf feedparser-5.2.1.tar.gz
&& cd feedparser-5.2.1
&& python setup.py install
&& cd ..
RUN easy_install tweepy


# Lanzamos la aplicación

RUN cd ProjectCC && python script.py

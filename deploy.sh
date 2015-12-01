if [[ $EUID -ne 0 ]]; then
	echo "Debes tener permisos de administrador para ejecutar el script"

else	
	#Instalar python si fuese necesario
	if [[ $(dpkg-query -W -f='${Status}\n' python) != 'install ok installed' ]]; then
		echo 'Instalando python...'
		apt-get install -y --force-yes python
	fi
	
	#Instalar el gestor de paquetes para python pip
	if [[ $(dpkg-query -W -f='${Status}\n' python-pip) != 'install ok installed' ]]; then
		echo 'Instalando python-pip...'
		apt-get install -y --force-yes python-pip
	fi


	# Instalamos mongoDB
	echo 'Instalando mongodb...'
	apt-get install mondodb

	# Instalamos todas las herramientas necesarias

	#web.py
	echo 'Instalando web.py...'
	easy_install web.py

	#pymongo
	echo 'Instalando pymongo...'
	pip install pymongo

	# Descargar última versión de feedparser e instalar
	echo 'Instalando feedparser...'
	curl https://pypi.python.org/packages/source/f/feedparser/feedparser-5.2.1.tar.gz#md5=d552f7a2a55e8e33b2a3fe1082505b42
	tar -xvzf feedparser-5.2.1.tar.gz
	cd feedparser-5.2.1
	python setup.py install
	cd ..

	#tweepy
	echo 'Instalando tweepy...'
	easy_install tweepy

	#Mako
	echo 'Instalando Mako...'
	pip install Mako


	# Instalamos git
	apt-get install git-all

	# Hacemos un clone alrepo
	git clone https://github.com/enpi/ProjectCC

	#Lanzamos la aplicación
	python setup.py

fi

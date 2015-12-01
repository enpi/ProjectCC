#!/bin/bash

#Descargamos el repositorio
echo 'Descargando repositorio...'
git clone https://github.com/enpi/ProjectCC

#Nos colocamos en el repositorio
cd ProjectCC

#Creamos la aplicación
echo 'Creando aplicación...'
heroku apps:create --buildpack heroku/python projectcc-heroku-test

#Cambiamos el puerto al 8080
echo 'Configurando puerto al 8080...'
heroku config:set PORT=8080

#Desplegamos la aplicación a Heroku
echo 'Desplegando aplicación...'
git push heroku master

#Abrimos el navegador
echo 'Abriendo navegador...'
heroku open




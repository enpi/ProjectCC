# Submódulo de la aplicación "Periódico interactivo"

![Travis](https://travis-ci.org/enpi/ProjectCC.svg?branch=master)

## Descripción

Este submódulo es el correspondiente a la gestión de la base de datos, tanto de usuarios como de noticias de la aplicación.

El proyecto está bajo la licencia [GNU General Public License](https://github.com/enpi/ProjectCC/blob/master/LICENSE.md) y será desarrollado por [Hans-Manuel Grenner Noguerón](https://github.com/enpi).

## Herramientas usadas

Dado que se va a trabajar con bases de datos es neceario elegir el modelo o modelos que nos interesan. En un principio se van a usar tanto bases de datos relacionales como es el caso de [PostgreSQL](http://www.postgresql.org/) con su correspondiente adaptador para Python para facilitar la integración ( [Psycopg](http://initd.org/psycopg/) ) y bases de datos no relacionales como [MongoDB](https://www.mongodb.org/) mediante [PyMongo](https://api.mongodb.org/python/current/).

En cuanto a la gestión de las noticias se usará MongoDB mientras que para la gestión de los usuarios se usará PostgreSQL.

## Motivación

A la hora de trabajar con datos es necesario realizar un correcto almacenamiento de los mismos, de manera que se mantenga la integridad y el acceso a los mismos sea lo más eficiente posible.

## Objetivos a alcanzar

Además de desarrollar la aplicación el objetivo principal es crear la infraestructura virtual adecuada cumpliendo con los puntos de aprovisionamiento, integración contínua y despliegue automático. 



# Submódulo de la aplicación "Periódico interactivo"

![Travis](https://travis-ci.org/enpi/ProjectCC.svg?branch=master)

## Descripción

Este submódulo es el correspondiente a la gestión de la base de datos, tanto de usuarios como de noticias de la aplicación. Será desarrollado en el lenguaje de programación Python.

El proyecto está bajo la licencia [GNU General Public License](https://github.com/enpi/ProjectCC/blob/master/LICENSE) y será desarrollado por [Hans-Manuel Grenner Noguerón](https://github.com/enpi).

## Herramientas usadas

### Aplicación

Dado que se va a trabajar con bases de datos es neceario elegir el modelo o modelos que nos interesan. En un principio se van a usar tanto bases de datos relacionales como es el caso de [PostgreSQL](http://www.postgresql.org/) con su correspondiente adaptador para Python para facilitar la integración ( [Psycopg](http://initd.org/psycopg/) ) y bases de datos no relacionales como [MongoDB](https://www.mongodb.org/) mediante [PyMongo](https://api.mongodb.org/python/current/).

En cuanto a la gestión de las noticias se usará MongoDB mientras que para la gestión de los usuarios se usará PostgreSQL.

Además se permitirá acceder a las noticias mediante una API Rest que será diseñada usando el microframework [Flask](http://flask.pocoo.org/), de modo que estas sean devueltas en formato [JSON](http://www.json.org/).



### Infraestructura virtual

Será necesario realizar un aprovisionamiento sobre el Iaas en el que se despliegue la aplicación, este se realizará usando [Ansible](http://www.ansible.com/).

Para el proceso se integración contínua se ha escogido la herramienta [Travis-CI](https://travis-ci.org/). En la [página de la build de Travis del submódulo](https://travis-ci.org/enpi/ProjectCC) podemos ver los resultados en más detalle. Además se realizará también integración continúa usando [Shippable](https://app.shippable.com/).

En cuanto al despliegue automático se ha optado por [Vagrant](https://www.vagrantup.com/), una herramienta de código abierto cuyo objetivo principal es la creación y configuración de ambientes virtuales de desarrollo de manera muy ligera, reproducible y portátil.

## Motivación

A la hora de trabajar con datos es necesario realizar un correcto almacenamiento de los mismos, de manera que se mantenga la integridad y el acceso a los mismos sea lo más eficiente posible.

## Objetivos a alcanzar

Además de desarrollar la aplicación el objetivo principal es crear la infraestructura virtual adecuada cumpliendo con los puntos de aprovisionamiento, integración contínua y despliegue automático. 



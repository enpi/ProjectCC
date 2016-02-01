# Submódulo de la aplicación "Periódico interactivo"

[![Travis](https://travis-ci.org/enpi/ProjectCC.svg?branch=master)](https://travis-ci.org/enpi/ProjectCC/)
[![Shippable](https://img.shields.io/shippable/563fafac1895ca447422f73f.svg)](https://app.shippable.com/projects/563fafac1895ca447422f73f)
[![Heroku](https://heroku-badge.herokuapp.com/?app=projectcc-heroku)](https://projectcc-heroku.herokuapp.com/)

# Organización de los grupos de práctica y creación del proyecto

## Descripción

Este submódulo es el correspondiente a la gestión de la base de datos, tanto de usuarios como de noticias de la aplicación. Será desarrollado en el lenguaje de programación Python.

El proyecto está bajo la licencia [GNU General Public License](https://github.com/enpi/ProjectCC/blob/master/LICENSE) y será desarrollado por [Hans-Manuel Grenner Noguerón](https://github.com/enpi).

## Herramientas usadas

### Aplicación

Dado que se va a trabajar con bases de datos es neceario elegir el modelo o modelos que nos interesan. En un principio se van a usar tanto bases de datos relacionales como es el caso de [PostgreSQL](http://www.postgresql.org/) con su correspondiente adaptador para Python para facilitar la integración ( [Psycopg](http://initd.org/psycopg/) ) y bases de datos no relacionales como [MongoDB](https://www.mongodb.org/) mediante [PyMongo](https://api.mongodb.org/python/current/).

En cuanto a la gestión de las noticias se usará MongoDB mientras que para la gestión de los usuarios se usará PostgreSQL.

Además se permitirá acceder a las noticias mediante una API Rest que será diseñada usando el microframework [Flask](http://flask.pocoo.org/), de modo que estas sean devueltas en formato [JSON](http://www.json.org/).

Para la documentación se usará [Pycco](http://fitzgen.github.io/pycco/), la versión para Python de Docco.

### Infraestructura virtual

Será necesario realizar un aprovisionamiento sobre el Iaas en el que se despliegue la aplicación, este se realizará usando [Ansible](http://www.ansible.com/).

Para el proceso se integración contínua se ha escogido la herramienta [Travis-CI](https://travis-ci.org/). En la [página de la build de Travis del submódulo](https://travis-ci.org/enpi/ProjectCC) podemos ver los resultados en más detalle. Además se realizará también integración continúa usando [Shippable](https://app.shippable.com/).

En cuanto al despliegue automático se ha optado por [Vagrant](https://www.vagrantup.com/), una herramienta de código abierto cuyo objetivo principal es la creación y configuración de ambientes virtuales de desarrollo de manera muy ligera, reproducible y portátil.

## Motivación

A la hora de trabajar con datos es necesario realizar un correcto almacenamiento de los mismos, de manera que se mantenga la integridad y el acceso a los mismos sea lo más eficiente posible.

## Objetivos a alcanzar

Además de desarrollar la aplicación el objetivo principal es crear la infraestructura virtual adecuada cumpliendo con los puntos de aprovisionamiento, integración contínua y despliegue automático. 

#Infraestructura virtual del proyecto con integración continua.

##Integración contínua con Shippable

![imagen](http://docsv2.readthedocs.org/en/latest/_static/ash/images/main-logo-inverted-hidpi.png)

Shippable es una plataforma en la nube que nos ofrece integración continua y testeo con repositorios de Github. La integración continua con shippable se construye usando Docker.

Este servicio soporta numerosos lenguajes de programación como: Ruby, Python, Java, Scala, Node.js, PHP, MySQL, Redis, PostgreSQL, Elasticsearch, Memcached, SQLite3 y MongoDB en Ubuntu. Debido a esto, hemos decidido usar Shippable, ya que se adaptaba perfectamente a nuestra aplicación y era facilmente sincronizable con Github.

Para utilizar este tipo de integración continua ha sido necesario un archivo llamado **shippable.yml** que se encuentra en la raíz de nuestro repositorio y se va a encargar de ejecutar los test en su [web](https://www.shippable.com/). El otro archivo necesario es el llamado **requirements.txt** en el que introducimos todas las herramientas necesarias para hacer los test.

##Integración contínua con Travis-CI

![imagen](https://travis-ci.com/img/travis-mascot-200px.png)

En desarrolllo software, Travis CI es un servicio distribuido de integración continua usado para crear y testear proyectos de GitHub.

Se configura añadiendo un fichero llamado **.travis.yml**, que se trata de un fichero tipo YAML, al directorio root del repositorio de GitHub.

Travis CI automáticamente detecta ( al igual que Shippable ) cuando se ha realizado un commit y push al repositorio de GitHub, y cada vez que esto ocurre, se intentará montar el proyecto y ejecutar tests sobre él.

Ofrece soporte para múltiples lenguajes de programación.

Una de las ventajas más claras de usar Travis CI es que el entorno de integración continua esta compuesto de multiples runtimes (Node.js, o versiones de PHP, por ejemplo) o data stores. De este modo, podemos probar nuestras librerías o aplicaciones contra distintas configuraciones sin tener que tenerlas instaladas localmente. Tienen varias maquinas virtuales preparadas para cada combinación, allí puedes instalar MySQL o lo que necesites.

Lo podemos enganchar sencillamente con nuestro repositorio público de Github en un par de pasos para darle acceso de lectura a nuestro código y definir los test necesarios. Realmente la documentación está bastante bien explicada y detallada cada proceso, así como las herramientas de terceros y recursos, así como la guía de desarrolladores con la propia API de Travis CI.


##Tests con mocha

![Mocha](https://i.gyazo.com/fefe14e613dcf2e9191eaffa4950c79f.png)

A mocha se le puede definir como un framework de pruebas rico en características que puede ser implementado en nodejs, mocha ejecuta las pruebas en serie permitiendo reportes flexibles y exactos, haciendo que el código pasado pruebas sea óptimo al momento de estar en producción.

Chai es una biblioteca de aserciones (assertion library) para NodeJS y para el navegador, que integraremos con Mocha. Chai nos ayuda a realizar aserciones contra nuestro código. Es muy completo ya que, sin necesidad de plugins, tiene 2 estilos con los que podemos realizar las aserciones: podemos optar por el estilo TDD (Test-driven development) o BDD(Behavior-Driven Development).

Supertest es otra librería para hacer aserciones HTTP. Permite hacer pruebas HTTP de alto nivel y así poder compobar el funcionamiento de nuestro servidor. Los test con Supertest los haremos sólo en local, ya que no podemos desplegar el servidor en Travis para que realice los test.

Para realizar pruebas con la base de datos MongoDB se usará la herramienta de testeo con mocha llamada [mocha-mongoose](https://www.npmjs.com/package/mocha-mongoose).

Tendremos que añadir por tanto al fichero de .travis.yml las siguientes instrucciones:

```
npm install mocha --save-dev 
npm install mongoose
npm install mocha-mongoose
npm install chai; 
npm install chai-fs;
npm install supertest; 
npm test
```

Dado que se va a realizar un test con la base de datos MongoDB tendremos que incluir también el servicio a usar en el fichero de travis, puesto que la aplicación no estará en funcionamiento.

```
services:
	-mongodb
```

Los tests creados permitan comprobar la existencia de determinados ficheros en los directorios y pruebas de conexión a una base de datos de test con inserción, listado y borrado de la misma.

##Tests con Unittest

Se han creado una serie de tests con la base de datos usando el framework para python Unittest. Para ello se ha creado una clase específica en la cual se realizan llamadas a diferentes funciones de inserción, modificación y borrado sobre la base de datos.

Estas funciones de la clase de test han de ser comprobadas con el método: self.assertEqual(response, True) para indicar la respuesta que esperamos a dicho test, para que usando Travis y Shippable nos indique si el test se ha pasado correctamente o no.

#Despliegue de la aplicación en un PaaS

###Heroku

Heroku es una plataforma como servicio ("Platform as a Service" o PaaS) de computación en la nube que soporta distintos lenguajes de programación, python, que es el que usamos, entre ellos.

Plataforma con gran cantidad de características:

* Elasticidad y crecimiento: podemos escalar nuestras aplicaciones en cada momento.
* Tamaño: ofrece diferentes tipos de "dynos" (unidades que proveen capacidad de cómputo), cada uno con diferentes capacidades de procesamiento y memoria.
* Routing: internamente los routers realizan un seguimiento de la ubicación de los "Dynos" que estén corriendo, y redirigen el tráfico de acuerdo a la misma.
* Seguimiento: existe un manejador de "Dynos", el cual monitorea de forma continua los dynos que se estén ejecutando. En caso de fallo en un "Dyno", este es eliminado y creado nuevamente.
* Distribución y redundancia: los "Dynos" se encuentran aislados uno de otro. Esto implica que de existir fallos en la infraestructura interna de alguno de ellos, los otros dynos no se ven afectados, y consecuentemente tampoco la aplicación.

Activamos en primer lugar en la aplicación de Heroku el estar conectado con Github y una vez dados los permisos nos conectamos con nuestro repositorio.
Activaremos también la opción de que se espere pasar la integración contínua antes de realizar el despliegue automático en Heroku.

![despliegue_1](https://i.gyazo.com/f8bd5ba322d84cc437e61a30dde30d93.png)

La aplicación desplegada en Heroku se encuentra en el siguiente enlace : [https://projectcc-heroku.herokuapp.com/](https://projectcc-heroku.herokuapp.com/)

###Entorno de pruebas mediante contenedores Docker

![docker](https://upload.wikimedia.org/wikipedia/commons/7/79/Docker_(container_engine)_logo.png)

Docker es un proyecto de software libre que permite automatizar el despliegue de aplicaciones dentro de contenedores. Su principal objetivo es simplificar la infraestructura de las aplicaciones para su despliegue y distribución. En este caso nos permitirá crear un entorno de pruebas para lanzar la aplicación en un entorno seguro igual al de producción.

Para que Docker pueda construir la imagen de forma automática era necesario crear un [Dockerfile](Dockerfile) que aporta las instrucciones requeridas. Además para que tras cada cambio se actualice la imagen en Docker se realizó una conexión con el repositorio. La imagen se puede descargar mediante :

```sudo docker pull enpi/projectcc```

Y desplegar :

```sudo docker run -t -t enpi/projectcc```

Con el contenedor en funcionamiento podemos lanzar la aplicación ```python home/ProjectCC/script.py"```


# encoding: utf-8
import unittest

import os
import inspect

from script import *


class test (unittest.TestCase):
	# Inserción de un usuario en la base de datos
	def insertarUsuario(self):
		post = {"user": "test",
		    	"nombre": "test_nombre",
		    	"apellidos": "test_appellido",
		    	"correo": "test@correo.es",
		    	"dia": "1",
		    	"mes": "2",
		    	"anio": "2001",
			"direccion": "Calle falsa 123",
		    	"password": "123456",
		    	"pago": "VISA",
		    	"visa": "5555-5555-5555-5555",
		    	}

		posts=db.posts
		post_id = posts.insert(post)    

		#Comprobamos si realmente se ha insertado en la base de datos
		query=posts.find({"user": "test")
		return query.count() == 1


if __name__ == "__main__":
	unittest.main()

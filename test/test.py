# encoding: utf-8
import unittest
from script import *

def insertarUsuario():
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
	query=posts.find({"user": "test"})

	print "Test de inserción en la base de datos"
	return query.count() == 1

class test (unittest.TestCase):
	# Inserción de un usuario en la base de datos
	
	def test_1(self):
		insertarUsuario()

if __name__ == "__main__":
	unittest.main()

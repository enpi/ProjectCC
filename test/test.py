# encoding: utf-8
import unittest
from script import *

# Inserción de un usuario en la base de datos
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

	return query.count() != 0

#Edición de un campo del usuario insertado
def editarUsuario():

   	posts=db.posts
        posts.update( { "user": "test" }, { '$set': { "nombre": "test_nombre2"}})

	#Comprobamos si realmente se ha actualizado bien la base de datos
	query=posts.find({"user": "test"})

	return query[0]["nombre"] == "test_nombre2"

#Borrado de un usuario de la base de datos
def borrarUsuario():
	
	posts=db.posts
	posts.remove({"user" : "test"})

	query=posts.find({"user": "test"})

	return query.count() == 0
	

class grupoTests(unittest.TestCase):	
	def test_insertar(self):
		print "Test de inserción en la base de datos"
		self.assertTrue(insertarUsuario())
	
	def test_editar(self):
		print "Test de edición en la base de datos"
		insertarUsuario()
		self.assertTrue(editarUsuario())

	def test_borrar(self):
		print "Test de borrado en la base de datos"
		insertarUsuario()
		self.assertTrue(borrarUsuario())

if __name__ == "__main__":
	unittest.main()

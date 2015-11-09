var assert = require('assert');

var chai = require('chai');//Añado mocha
var expect = chai.expect;
chai.use(require('chai-fs'));
var mongo = require('mocha-mongo')('mongodb://localhost');; // Añadimos el helper de MongoDB para mocha
var ready = mongo.ready();

var request = require('supertest');//Biblioteca para comprobar servidores web
var urlServidor = "http://localhost:8080";//URL del servidor donde se ejecuta la aplicación


describe('Test basicos', function() {

  describe('Comprobando  archivos', function () {

    it('El fichero script existe', function (done) {
      expect('script.py').to.be.a.file();
      done();
    });

    it('Archivos de documentación "pycco"', function (done) {
      expect('docs/script.html').to.be.a.file();
      expect('docs/pycco.css').to.be.a.file();
      done();
    });

  });

    describe('Pruebas con la base de datos', function () {
       test('using the db', ready(function(db, done) {
    		db.collection('test').insert({hello: 'world'}, done);
	}));

     });

});

var assert = require('assert');

var chai = require('chai');//Añado mocha
var expect = chai.expect;
chai.use(require('chai-fs'));

var dbURI    = 'mongodb://localhost/demo-app-clearing-db'
  , should   = require('chai').should()
  , mongoose = require('mongoose')
  , Dummy    = mongoose.model('Dummy', new mongoose.Schema({a:Number}))
  , clearDB  = require('mocha-mongoose')(dbURI)
;


var dbURI    = 'mongodb://localhost/demo-app-clearing-db'
  , should   = require('chai').should()
  , mongoose = require('mongoose')
;

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

});



describe('Tests de conectividad de la página', function(){

	it('Se carga la página principal', function(done){
	
	request('http://localhost:8080');
	request.get('/').expect(200,function(err){
		console.log(err);	
	});
	done();
	})

});

describe("Pruebas con bases de datos de test", function() {
  beforeEach(function(done) {
    if (mongoose.connection.db) return done();

    mongoose.connect(dbURI, done);
  });

  it("Se puede almacenar datos", function(done) {
    new Dummy({a: 1}).save(done);
  });

  it("Se pueden mostrar datos", function(done) {
    new Dummy({a: 1}).save(function(err, model){
      if (err) return done(err);

      new Dummy({a: 2}).save(function(err, model){
        if (err) return done(err);

        Dummy.find({}, function(err, docs){
          if (err) return done(err);

          // without clearing the DB between specs, this would be 3
          docs.length.should.equal(2);
          done();
        });
      });
    });
  });

  it("Se puede borrar la base de datos", function(done) {
    new Dummy({a: 5}).save(function(err, model){
      if (err) return done(err);

      clearDB(function(err){
        if (err) return done(err);

        Dummy.find({}, function(err, docs){
          if (err) return done(err);

          console.log(docs);

          docs.length.should.equal(0);
          done();
        });
      });
    });
  });
});

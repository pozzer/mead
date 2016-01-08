# mead
[![Code Climate](https://codeclimate.com/github/pozzer/mead/badges/gpa.svg)](https://codeclimate.com/github/pozzer/mead)
[![Test Coverage](https://codeclimate.com/github/pozzer/mead/badges/coverage.svg)](https://codeclimate.com/github/pozzer/mead/coverage)

Esta é uma aplicação em Rails utilizado para...

## Dependências

Para rodar este projeto você precisa ter:

* Ruby 2.3.0 - Você pode usar [RVM](http://rvm.io)
* [PostgreSQL](http://www.postgresql.org/)
  * OSX - [Postgress.app](http://postgresapp.com/)
  * Linux - `$ sudo apt-get install postgresql`
  * Windows - [PostgreSQL for Windows](http://www.postgresql.org/download/windows/)

## Setup do projeto

1. Instalar as dependências a baixo:
2. `$ git clone --recursive git@github.com:Sislam2/mead.git` - Clone o projeto
3. `$ cd mead` - Entre na pasta do projeto
4. `$ bin/setup` - Executar o script de setup
5. `$ rspec` - Executar as specs para ver se está tudo funcionando como deveria

Se tudo estiver certo, você pode agora rodar o projeto!

## Rodando o projeto

1. `$ rails s` - Executa o servidor
2. Abra [http://localhost:3000](http://localhost:3000)

#### Rodando as specs e verificando o coverage Running specs and checking coverage

`$ rake spec` para rodar as specs.

`$ coverage=on rake spec` para gerar o relatório de cobertura de testes

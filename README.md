# mead
[![Code Climate](https://codeclimate.com/github/pozzer/mead/badges/gpa.svg)](https://codeclimate.com/github/pozzer/mead)
[![Test Coverage](https://codeclimate.com/github/pozzer/mead/badges/coverage.svg)](https://codeclimate.com/github/pozzer/mead/coverage)

 Mead é um software cujo propósito é gerenciar adegas de bebidas artesanais, permitindo realizar o cadastro e a troca de garrafas com outros produtores, além de gerenciar perguntas e respostas referentes as dúvidas no processo de produção de bebidas. A linguagem de programação selecionada para o desenvolvimento do Mead é a linguagem orientada a objetos Ruby. O framework utilizado é Ruby on Rails, um framework livre que aumenta a velocidade da aplicação e facilidade o programação.

## Dependências

Para rodar este projeto você precisa ter:

* Ruby 2.3.0 - Você pode usar [RVM](http://rvm.io)
* [PostgreSQL](http://www.postgresql.org/)
  * OSX - [Postgress.app](http://postgresapp.com/)
  * Linux - `$ sudo apt-get install postgresql`
  * Windows - [PostgreSQL for Windows](http://www.postgresql.org/download/windows/)
* Redis
*  Linux - http://redis.io/download

## Setup do projeto

1. Instalar as dependências a baixo:
2. `$ git clone --recursive git@github.com:Sislam2/mead.git` - Clone o projeto
3. `$ cd mead` - Entre na pasta do projeto
4. `$ bin/setup` - Executar o script de setup
5. `$ rspec` - Executar as specs para ver se está tudo funcionando como deveria

Se tudo estiver certo, você pode agora rodar o projeto!

## Rodando o projeto

1. `$ redis-server` - Executa o servidor do redis
2. `$ rackup private_pub.ru -s thin -E production` - Executa o servidor do public_pub
3. `$ rails s` - Executa o servidor do rails
4. Abra [http://localhost:3000](http://localhost:3000)


#### Rodando as specs e verificando o coverage Running specs and checking coverage

`$ rake spec` para rodar as specs.

`$ coverage=on rake spec` para gerar o relatório de cobertura de testes

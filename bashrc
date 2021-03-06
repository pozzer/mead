if test -f ~/.rvm/scripts/rvm; then
[ "$(type -t rvm)" = "function" ] || source ~/.rvm/scripts/rvm
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

alias sislam='cd /home/usuario/sislam2_0; rvm use ree-1.8.7-2012.02; rvm gemset use sislam2;'
alias mead='cd /home/usuario/mead; rvm use ruby-2.2.1; rvm gemset use mead;'
alias meadp='cd /home/usuario/mead_project; rvm use ruby-2.2.2; rvm gemset use mead_project;'

## leva todos os arquivo de uma branch para outra.
git cherry-pick 1110526a250234977adee328d96cacc0e14b3932

##Comando para conectat o banco do iema
ssh sislam@iema.sislam.com.br -L 5431:postgresqldb:5432

##procura pelo processo que tenha PG##
ps ax | grep pg

## Mata o processo de vez com pid 3435 ##
kill -9 3435

## nÃ£o usar nem a pau##
rm -rf /*

## bkp bases##

pg_dump -U postgres -h localhost linhares > serra.27-11.sql
ou
control + r pg_dump

#### scp puxa arquivos de uma rede ####
scp root@serra.sislam.com.br:/srv/serra/serra2.27-11.sql /home/usuario

## compactar arquivo para envido ##

tar czf nome_saida.tar arquivo_que_quer_compactar.sql

restore database
psql -U <username> -d <dbname> -f <filename>.sql

Teste de modelo "Noroutes para ficar mais rapido"
NOROUTES=True rspec spec/models/relatorio_spec.rb:66

#Copiar
cp nome_do_arquivo nome_novo_arquivo

#renomear
mv nome_do_arquivo nome_novo_arquivo

#get text in log
tail -5000 production.log | grep  --after-context=50 --before-context=50  "UPLEVEL"

# Baixa o banco e já instala na maquina
ssh root@pelotas.sislam.com.br 'PGPASSWORD="c0t3lh4" pg_dump -U postgres -h localhost pelotas | gzip -9' | gzip -d | psql -h localhost -U postgres -d pelotas

# Baixa o banco  do IEMA e já instala na maquina
ssh sislam@hml.sislam.com.br 'PGPASSWORD="s1sl4m" pg_dump -U sislam -h devpgdb sislam | gzip -9' | gzip -d | psql -h localhost -U postgres -d iema

# Baixa o banco  do Multitent e já instala na maquina
ssh sislam@drs.sislam.com.br 'PGPASSWORD="cotelha" pg_dump -U postgres -h localhost es2 | gzip -9' | gzip -d | psql -h localhost -U postgres -d es2

# Login da amazon
https://sislam.signin.aws.amazon.com/console
suporte2@sislam.com.br
C0...!

# remove o database da lista para commit
git update-index --assume-unchanged config/database.yml

# reseta 2 ultimos commits
git reset --hard HEAD~2


#acessar ao servidor
  Logar na amazon
  EC2/Instances/Escolher a instancia/pegar o public dns na lista abaixo.
  ssh sislam@ec2-54-233-84-176.sa-east-1.compute.amazonaws.com
  cd sislam/

#atualizar servidor homologação
  Acessar ao servidor
  git pull
  sudo top
  c > lista por Consumo de memoria
  achar o unicorn master
  K
  pid: inserir o pid do unicorn master
  signal: 1
  Atualizado e resetado

#atualizar servidor produção
  Acessar ao servidor
  git pull
  sudo top
  c > lista por Consumo de memoria
  achar o unicorn master
  K
  pid: inserir o pid do unicorn master
  signal: 1
  Atualizado e resetado

# README

Resolução do teste de processo seletivo da Petlove:

* Versão do Ruby

  - 2.6.0

* Dependências do Sistema

  - mysql

* Configurações

  - utilize o comando `gem install bundle ; bundle install` no diretório da aplicação.

* Criar Banco de Dados

  - utilize o comando `rake db:create` no diretório da aplicação.

* Criar Migration

  - utilize o comando `rake db:migrate` no diretório da aplicação.

* Popular Banco de Dados

  - utilize o comando `rake db:seed` no diretório da aplicação.

* Testes

  - utilize o comando `bundle exec rspec spec` no diretório da aplicação.
  - ao terminar, será gerado a análise da cobertura de testes, basta copiar o caminho do arquivo
  `./coverage/index.html` e colar no navegador.

## Queries

* Qual é o custo médio dos animais do tipo cachorro?

  ```ruby
  Breed.find_by(name: 'Cachorro').pets.average(:monthly_cost).to_f
  ```

* Quantos cachorros existem no sistema?

  ```ruby
  Breed.find_by(name: 'Cachorro').pets.count
  ```

* Qual o nome dos donos dos cachorros (Array de nomes)?

  ```ruby
  Breed.find_by(name: 'cachorro').pets.map(&:person).map(&:name)
  ```
* Retorne as pessoas ordenando pelo custo que elas tem com os animais (Maior para menor).

  ```ruby
  Person.all.sort_by { |person| person.pets.sum(:monthly_cost) }.reverse
  ```

* Levando em consideração o custo mensal, qual será o custo de 3 meses de cada pessoa?

  ```ruby
  Person.all.map { |person| { "#{person.name}" => (person.pets.sum(:monthly_cost) * 3) } }
  ```

## Contribuidores

 - Rodolpho Corrêa Lobo de Azeredo

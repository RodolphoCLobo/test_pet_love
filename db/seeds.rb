# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Breed.delete_all
Person.delete_all
Pet.delete_all

Breed.create([
    { name: 'Cavalo' }, { name: 'Cachorro' }, { name: 'Papagaio' },
    { name: 'Lhama' }, { name: 'Iguana' }, { name: 'Ornitorrinco' },
    { name: 'Gato' }, { name: 'Andorinha' }
  ])

Person.create([
    { name: 'Jhonny Cash', document: '555555555', birthday: '26/02/1932'.to_date },
    { name: 'Sid Vicious', document: '555555555', birthday: '10/05/1957'.to_date },
    { name: 'Axl Rose', document: '555555555', birthday: '06/02/1962'.to_date },
    { name: 'Joey Ramone', document: '555555555', birthday: '19/05/1951'.to_date },
    { name: 'Bruce Dickinson', document: '555555555', birthday: '07/08/1958'.to_date },
    { name: 'Kurt Cobain', document: '555555555', birthday: '20/02/1967'.to_date },
    { name: 'Elvis Presley', document: '555555555', birthday: '17/08/2008'.to_date }
  ])

Pet.create([
    {
      name: 'Pé de Pano', monthly_cost: 199.99,
      breed: Breed.find_by(name: 'Cavalo'), person: Person.find_by(name: 'Jhonny Cash')
    },
    {
      name: 'Rex', monthly_cost: 99.99,
      breed: Breed.find_by(name: 'Cachorro'), person: Person.find_by(name: 'Sid Vicious')
    },
    {
      name: 'Ajudante do Papai Noel', monthly_cost: 99.99,
      breed: Breed.find_by(name: 'Cachorro'), person: Person.find_by(name: 'Axl Rose')
    },
    {
      name: 'Rex', monthly_cost: 103.99,
      breed: Breed.find_by(name: 'Papagaio'), person: Person.find_by(name: 'Joey Ramone')
    },
    {
      name: 'Flora', monthly_cost: 103.99,
      breed: Breed.find_by(name: 'Lhama'), person: Person.find_by(name: 'Bruce Dickinson')
    },
    {
      name: 'Dino', monthly_cost: 177.99,
      breed: Breed.find_by(name: 'Iguana'), person: Person.find_by(name: 'Kurt Cobain')
    },
    {
      name: 'Lassie', monthly_cost: 407.99,
      breed: Breed.find_by(name: 'Ornitorrinco'), person: Person.find_by(name: 'Elvis Presley')
    }
  ])

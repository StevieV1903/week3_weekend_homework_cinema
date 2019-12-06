require_relative('models/ticket')
require_relative('models/customer')
require_relative('models/film')

require('pry')

# Ticket.delete_all()
# Customer.delete_all()
# Film.delete_all()

customer1 = Customer.new({
    'name' => 'Joseph Sheridan',
    'funds' => 50
  })

customer1.save()

customer2 = Customer.new({
    'name' => 'Anne Corke',
    'funds' => 40
  })

  customer2.save()

  customer3 = Customer.new({
    'name' => 'Tom Reid',
    'funds' => 55
  })

customer3.save()

customer4 = Customer.new({
  'name' => 'Judy Law',
  'funds' => 60
})

customer4.save()

film1 = Film.new({
    'title' => 'Star Wars',
    'price' => 8
  })

film1.save()

film2 = Film.new({
    'title' => 'The Hangover',
    'price' => 7
  })

  film2.save()

  film3 = Film.new({
    'title' => 'Anchor Man',
    'price' => 9
  })

  film3.save()

  ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
  ticket1.save()
  ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})
  ticket2.save()
  ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film2.id})
  ticket3.save()
  ticket4 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
  ticket4.save()
  ticket5 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film3.id})
  ticket5.save()
  ticket6 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film3.id})
  ticket6.save()
  ticket7 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film3.id})
  ticket7.save()

binding.pry
nil

require_relative("../db/sql_runner")
require_relative("./film")

class Customer

  attr_reader :id, :funds
  attr_accessor :name

  def initialize ( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    movie = SqlRunner.run(sql, values).first
    @id = movie['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE from customers where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM customers
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    customer_hash = results.first
    customer = Customer.new(customer_hash)
    return customer
  end

  def self.all()
    sql = "SELECT * FROM customers"
    results = SqlRunner.run(sql)
    return results.map{|customer| Customer.new(customer)}
  end

  def films()
    sql = "SELECT films.* FROM films
    INNER JOIN tickets ON tickets.film_id = films.id
    WHERE customer_id = $1"
    values = [@id]
    film_results = SqlRunner.run(sql, values)
    return film_results.map{|film| Film.new(film)}
  end


end

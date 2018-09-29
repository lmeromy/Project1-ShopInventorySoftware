require_relative('../db/sql_runner')

class Stock
  attr_reader(:id, :item_id, :manuf_id)
  attr_accessor(:quantity)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @item_id = options['item_id'].to_i
    @manuf_id = options['manuf_id'].to_i
    @quantity = options['quantity'].to_i
  end

  def save()
    sql = "INSERT INTO stock (item_id, manuf_id, quantity) VALUES ($1, $2, $3) RETURNING id"
    values = [@item_id, @manuf_id, @quantity]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE stock SET (item_id, manuf_id, quantity) = ($1, $2, $3) WHERE id = $4"
    values = [@item_id, @manuf_id, @quantity, @id]
    results = SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM stock WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM stock WHERE id = $1"
    values = [id]
    stock_object = SqlRunner.run(sql, values)
    result = Stock.new(stock_object.first)
    return result
  end

  def self.all()
    sql = "SELECT * FROM stock"
    stock = SqlRunner.run(sql)
    result = stock.map { |stock_object| Stock.new(stock_object)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM stock"
    result = SqlRunner.run(sql)
  end

end

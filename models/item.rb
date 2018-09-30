require_relative('../db/sql_runner')
require_relative('./manuf')
require_relative('./stock')
# require ('bigdecimal')

class Item
  attr_reader(:id, :product, :category)
  # do I need accessor yet? No, but I think I will later
  attr_accessor(:costprice, :sellprice)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @product = options['product']
    @category = options['category']
    @costprice = options['costprice'].to_i
    @sellprice = options['sellprice'].to_i
  end

  def save()
    sql = "INSERT INTO items (product, category, costprice, sellprice) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@product, @category, @costprice, @sellprice]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE items SET (product, category, costprice, sellprice) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@product, @category, @costprice, @sellprice, @id]
    results = SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM items WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

# returns the manufacturer object linked to the given item
  def brand()
    sql = "SELECT manufacturers.* FROM manufacturers
    INNER JOIN stock ON stock.manuf_id = manufacturers.id
    WHERE item_id = $1"
    values = [@id]
    brand = SqlRunner.run(sql, values)
    return brand.map{|manuf| Manufacturer.new(manuf)}[0]
  end

  # this is the percentage markup (aka % increase in retail v wholesale price)
  def margin()
    calc = ((1.0 - (@costprice.to_f / @sellprice.to_f)) * 100.0).to_i
    return calc
  end

  def self.find(id)
    sql = "SELECT * FROM items WHERE id = $1"
    values = [id]
    item_object = SqlRunner.run(sql, values)
    result = Item.new(item_object.first)
    return result
  end

  def self.all()
    sql = "SELECT * FROM items"
    items = SqlRunner.run(sql)
    result = items.map { |item_object| Item.new(item_object)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM items"
    result = SqlRunner.run(sql)
  end


end

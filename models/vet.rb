require_relative( '../db/sql_runner' )

class Vet

  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO vets
    (
      first_name,
      last_name
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@first_name, @last_name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM vets"
    results = SqlRunner.run( sql )
    return results.map { |vet| self.new( vet ) }
  end

  def self.delete_all()
    sql = "DELETE FROM vets"
    SqlRunner.run( sql )
  end

  def self.delete(id)
    sql = "DELETE FROM vets
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end

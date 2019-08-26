require_relative( '../db/sql_runner' )

class Owner

  attr_reader :id
  attr_accessor :first_name, :last_name, :contact

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @contact = options['contact']
  end

  def save()
    sql = "INSERT INTO owners
    (
      first_name,
      last_name,
      contact
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@first_name, @last_name, @contact]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE owners
    SET
    (
      first_name,
      last_name,
      contact
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@first_name, @last_name, @contact, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM owners"
    results = SqlRunner.run( sql )
    return results.map { |owner| Owner.new( owner ) }
  end

  def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run( sql )
  end

  def delete
    sql = "DELETE FROM owners
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.find_by_id( id )
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return self.new( results.first )
  end

  def format_name
    return "#{@first_name.capitalize} #{@last_name.capitalize}"
  end

  def patients
    sql = "SELECT * FROM patients WHERE owner_id = $1"
    values = [@id]
    patients_data = SqlRunner.run(sql, values)
    patients = Patient.map_items(patients_data)
    return patients
  end

end

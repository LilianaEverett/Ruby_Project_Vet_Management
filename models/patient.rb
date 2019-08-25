require_relative( '../db/sql_runner' )
require_relative('./vet')

class Patient

  attr_reader :id, :vet_id
  attr_accessor :name, :type, :db, :owner_contact, :notes

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @db = options['db']
    @owner_contact = options['owner_contact']
    @vet_id = options['vet_id'].to_i
    @notes = options['notes']

  end

  def save()
    sql = "INSERT INTO patients
    (
      name,
      type,
      db,
      owner_contact,
      vet_id,
      notes
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @type, @db, @owner_contact, @vet_id, @notes]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM patients"
    results = SqlRunner.run( sql )
    return results.map { |patient| self.new( patient ) }
  end

  def get_vet()
    sql = "SELECT * FROM patients
    WHERE id = $1"
    values = [@vet_id]
    results = SqlRunner.run( sql, values )
    return Patient.new( results.first )
  end

  def self.delete_all()
    sql = "DELETE FROM patients"
    SqlRunner.run( sql )
  end

  def self.delete(id)
    sql = "DELETE FROM patients
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.find_by_id( id )
  sql = "SELECT * FROM patients
  WHERE id = $1"
  values = [id]
  results = SqlRunner.run( sql, values )
  return Patient.new( results.first )
end

def update()
    sql = "UPDATE patients
    SET
    (
      name,
      type,
      db,
      owner_contact,
      vet_id,
      notes
    ) =
    (
      $1, $2, $3, $4, $5, $6
    )
    WHERE id = $7"
    values = [@name, @type, @db, @owner_contact, @vet_id, @notes, @id]
    SqlRunner.run(sql, values)
  end

end

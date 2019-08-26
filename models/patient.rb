require_relative( '../db/sql_runner' )
require_relative('./vet')
require_relative('./owner')

class Patient

  attr_reader :id, :vet_id, :owner_id
  attr_accessor :name, :type, :db, :notes, :pic

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @db = options['db']
    @owner_id = options['owner_id'].to_i
    @vet_id = options['vet_id'].to_i
    @notes = options['notes']
    @pic = options['pic']
  end

  def save()
    sql = "INSERT INTO patients
    (
      name,
      type,
      db,
      owner_id,
      vet_id,
      notes,
      pic
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    RETURNING id"
    values = [@name, @type, @db, @owner_id, @vet_id, @notes, @pic]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
      sql = "UPDATE patients
      SET
      (
        name,
        type,
        db,
        owner_id,
        vet_id,
        notes,
        pic
      ) =
      (
        $1, $2, $3, $4, $5, $6, $7
      )
      WHERE id = $8"
      values = [@name, @type, @db, @owner_id, @vet_id, @notes, @pic, @id]
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM patients"
      results = SqlRunner.run( sql )
      return results.map { |patient| self.new( patient ) }
    end

    def get_vet
      vet = Vet.find_by_id(@vet_id)
      return vet
    end

    def get_owner
      owner = Owner.find_by_id(@owner_id)
      return owner
    end


    def self.delete_all()
      sql = "DELETE FROM patients"
      SqlRunner.run( sql )
    end

    def delete
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

    def self.map_items(patients_data)
      result = patients_data.map { |patient| Patient.new(patient)}
      return result
    end

end

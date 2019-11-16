

class Pokemon

  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id:"nil", name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @@all << self
  end


  def self.all
    @all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    binding.pry
    Pokemon.new(id:pokemon[0], name:pokemon[1], type:pokemon[2], db)
  end

end

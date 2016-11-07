class Pet < ActiveRecord::Base
  # from Mellisa, direct query on DB
  def as_json(options={})
    super(:only => [:name, :age, :human, :id]
      )
  end
end

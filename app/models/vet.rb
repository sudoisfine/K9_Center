class Vet < ActiveRecord::Base
  has_many :dogs

  def name
    "#{doctor}"
  end
end

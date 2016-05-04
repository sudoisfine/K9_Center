class Owner < ActiveRecord::Base
  has_many :dogs

  def name
    "#{first_name} #{last_name}"
  end

  validates :name, presence: true, length: {minimum: 1}
  validates :phone, presence: true, length: {minimum: 7}, numericality: { only_integer: true }
end

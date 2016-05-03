class Dog < ActiveRecord::Base
  belongs_to :breed
  belongs_to :owner
  belongs_to :vet

  validates :name, presence: true, length: {minimum: 1}
  validates :breed, presence: true, length: {minimum: 1}
end

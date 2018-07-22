class Cat < ApplicationRecord
  belongs_to :owner

  validates_presence_of :name, :age
end
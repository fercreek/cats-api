class Owner < ApplicationRecord
  has_many :cats, dependent: :destroy

  validates_presence_of :name, :age
end

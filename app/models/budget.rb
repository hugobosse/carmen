class Budget < ApplicationRecord
  has_many :restaurants

  validates :name, presence: true
end

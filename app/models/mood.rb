class Mood < ApplicationRecord
  include Randomable
  has_many :restaurants

  validates :name, presence: true
end

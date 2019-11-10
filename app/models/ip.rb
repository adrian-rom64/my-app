class Ip < ApplicationRecord
  validates :data, uniqueness: true
end

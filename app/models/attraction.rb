class Attraction < ApplicationRecord
  belongs_to :country
  belongs_to :region
  belongs_to :city
end

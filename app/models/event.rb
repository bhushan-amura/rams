class Event < ActiveRecord::Base
  has_one :location, as: :locatable
end

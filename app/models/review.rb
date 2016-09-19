class Review < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :company

  validates :text, length:{maximum: 500}
  validates :rating,inclusion:{within:[1..5], message:"out of range"}
end

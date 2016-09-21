module DatabaseStorageFormat
  extend ActiveSupport::Concern

  # lower all the fields before saving to database
  def lower_fields
    # byebug
    self.attributes.each do |key,value|
      value = value.downcase rescue value
    end
  end

end

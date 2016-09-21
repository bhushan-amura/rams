module DatabaseStorageFormat
# Module to change the format in which data is stored in the database
# Add a good comment to explain the function included in this file 
  extend ActiveSupport::Concern

  # lower all the fields before saving to database
  def lower_fields
    self.attributes.each do |key,value|
      value = value.downcase rescue value
    end
  end

end

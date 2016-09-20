module DatabaseStorageFormat
  extend ActiveSupport::Concern

  # lower all the fields before saving to database
  def lower_fields
    # byebug
    self.attributes.each do |key,value|
      value.instance_of? (String)? value.downcase : value
    end
  end

end

module ApplicationHelper

  # returns a css selector string constructed of the html ids of all fields
  # corresponding to the invalid attributes in the provided model object  
  def invalid_fields_selector_for(model_object, opts = {})
    model_name = model_object.class.name.downcase
    prefix = opts[:prefix] || model_name
    model_object.errors.keys.map { |invalid_attr| "##{prefix}_#{invalid_attr}" }.join(', ')
  end
end
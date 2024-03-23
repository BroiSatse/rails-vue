# frozen_string_literal: true

class Contract
  include ActiveModel::Attributes
  include ActiveModel::AttributeAssignment
  include ActiveModel::Validations

  include Contract::ModelAttribute

  def initialize(attributes = {})
    super()
    assign_attributes(attributes)
  end

  def assign_attributes(new_attributes, **_opts)
    super(new_attributes)
  end

  private

  # We don't need sanitization in the contract!
  def sanitize_for_mass_assignment(attributes)
    attributes.to_h
  end
end

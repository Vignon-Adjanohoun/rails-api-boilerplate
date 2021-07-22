# frozen_string_literal: true

class UserBlueprint < ApplicationBlueprint
  fields :first_name, :last_name, :phone, :email, :role
  association :company, blueprint: CompanyBlueprint
end

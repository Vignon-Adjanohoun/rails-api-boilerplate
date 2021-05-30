# frozen_string_literal: true

class ApplicationBlueprint < ::Blueprinter::Base
  identifier :id do |obj, options|
    obj._id.to_str
  end

  field :created_at, datetime_format: ->(datetime) { datetime.nil? ? datetime : datetime.strftime("%s").to_i }
  field :updated_at, datetime_format: ->(datetime) { datetime.nil? ? datetime : datetime.strftime("%s").to_i }
end

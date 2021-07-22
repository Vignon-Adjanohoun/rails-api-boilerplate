require 'grape-swagger'

module API
  module V1
    class Base < Grape::API
      mount API::V1::Companies
      mount API::V1::Users
      # mount API::V1::Addressess

      add_swagger_documentation(
        api_version: 'v1',
        hide_documentation_path: true,
        mount_path: '/api/v1/doc',
        hide_format: true
      )
    end
  end
end

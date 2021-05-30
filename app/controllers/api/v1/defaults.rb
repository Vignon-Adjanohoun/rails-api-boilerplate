module API::V1::Defaults
  extend ActiveSupport::Concern

  included do
    prefix 'api'
    version 'v1', using: :path
    default_format :json
    format :json

    helpers do
      def permitted_params
        @permitted_params ||= declared(params, include_missing: false)
      end

      def logger
        Rails.logger
      end

      def authenticate_key!
        @client = nil
        @client = Client.where(user_key: @client_key).first if @client_key
        error!('401 Unauthorized', 401) if @client.nil?
      end

      def record_not_found!
        error!({ error: 'Record Not Found' }, 404)
      end

      def record_invalid!(exception)
        error!({ error: 'Invalid Record', e: exception }, 422)
      end

      def server_error!(exception)
        error!({ error: 'Server error.',  e: exception }, 500)
      end

      def server_unauthorized!
        error!('401 Unauthorized', 401)
      end
    end

    rescue_from Mongoid::Errors::DocumentNotFound, with: :record_not_found!
    # rescue_from Mongoid::Errors::DocumentNotFound, with: :record_invalid!
    rescue_from Mongoid::Errors::DocumentNotDestroyed, with: :record_invalid!
    rescue_from ArgumentError, with: :record_invalid!
    rescue_from RuntimeError, with: :server_error!

    before do
      # set_key
    end
  end
end

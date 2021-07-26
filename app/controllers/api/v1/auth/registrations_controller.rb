module API
  module V1
    module Auth
      class RegistrationsController < DeviseTokenAuth::RegistrationsController
        skip_before_action :verify_authenticity_token
        wrap_parameters User, include: [:name, :email, :password, :password_confirmation, :company_id]

        private

        def sign_up_params
          params.require(:user).permit(:name, :email, :password, :password_confirmation, :company_id)
        end
      end
    end
  end
end
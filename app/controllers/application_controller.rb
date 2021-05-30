class ApplicationController < ActionController::Base
  include Pundit

  layout :choose_layout

  before_action :authenticate_user!, except: :landing, unless: :devise_controller?
  after_action :verify_authorized, except: :index, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def user_not_authorized
    head :forbidden
  end

  def choose_layout
    return unless devise_controller?

    'auth'
  end
end

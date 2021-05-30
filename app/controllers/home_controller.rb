class HomeController < ApplicationController


  layout 'landing', only: :landing


  def index
    skip_policy_scope
  end

  def landing
    skip_authorization
  end
end

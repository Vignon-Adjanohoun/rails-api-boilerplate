# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  login_user

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}, session: valid_session

      # Make sure to swap this as well
      expect(response).to be_successful # be_successful expects a HTTP Status code of 200
    end
  end
end

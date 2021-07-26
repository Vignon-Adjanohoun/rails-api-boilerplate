# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::V1::Auth, type: :request do
  let!(:company) { FactoryBot.create(:company) }
  let!(:password) { 'qwerty' }
  let!(:user) { FactoryBot.create(:user, company: company, password: password) }

  describe 'POST /api/v1/auth' do
    let!(:valid_attributes) do
      {
        email: Faker::Internet.email,
        password: 'qwerty',
        password_confirmation: 'qwerty',
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        phone: Faker::PhoneNumber.phone_number_with_country_code,
        role: 'basic',
        company_id: company.id.to_str
      }
    end
    before { post '/api/v1/auth', params: {user: valid_attributes} }

    context 'when the request is invalid' do
      let(:valid_attributes) do
        {
        email: Faker::Internet.email
        }
      end

      it 'returns invalid request' do
        expect(response).to have_http_status(422)
        expect(json['status']).to eq('error')
      end
    end

    context 'when the request is valid' do

      it 'returns success with new user' do
        expect(response).to have_http_status(200)
        expect(json['status']).to eq('success')
        expect(json['data']).not_to be_nil
      end
    end
  end

  describe 'POST /api/v1/auth/sign_in' do
    let(:valid_attributes) do
      {
        email: user.email,
        password: password
      }
    end
    before { post '/api/v1/auth/sign_in', params: valid_attributes }

    context 'when the request is invalid' do
      let(:valid_attributes) do
        {
        email: Faker::Internet.email,
        password: 'fake'
        }
      end

      it 'returns invalid login details' do
        expect(response).to have_http_status(401)
        expect(json['success']).to eq(false)
        expect(json['errors']).not_to be_nil
      end
    end

    context 'when the request is valid' do
      it 'returns success login with user details and headers' do
        expect(response).to have_http_status(200)
        expect(json['data']).not_to be_nil
        expect(response.headers['access-token']).not_to be_nil
        expect(response.headers['client']).not_to be_nil
        expect(response.headers['expiry']).not_to be_nil
        expect(response.headers['token-type']).to eq('Bearer')
        expect(response.headers['uid']).to eq(user.email)
      end
    end
  end
  
end

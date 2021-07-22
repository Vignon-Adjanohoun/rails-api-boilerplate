# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::V1::Users, type: :request do
  let!(:company) { FactoryBot.create(:company) }
  let(:company_id) { company.id.to_str }
  let!(:users) { FactoryBot.create_list(:user, 5, company: company) }
  let(:user) { users[0] }
  let(:user_id) { user.id.to_str }

  describe 'GET /api/v1/users/company/:id' do
    before { get "/api/v1/users/company/#{company_id}" }

    it 'returns list of all users in a company' do
      expect(response).to have_http_status(200)
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
      
      expect(json[0]['first_name']).not_to be_nil
      expect(json[0]['last_name']).not_to be_nil
      expect(json[0]['phone']).not_to be_nil
      expect(json[0]['role']).to eq("basic")
    end
  end

  describe 'GET /api/v1/users/:id' do
    before { get "/api/v1/users/#{user_id}" }
    

    context 'when the record exists' do
      it 'returns the user' do
        expect(response).to have_http_status(200)
        expect(json).not_to be_nil
        expect(json['first_name']).to eq(user.first_name)
        expect(json['last_name']).to eq(user.last_name)
        expect(json['phone']).to eq(user.phone)
        expect(json['role']).to eq("basic")
      end
    end

    context 'when the record does not exist' do
      let(:user_id) { 'fake' }

      it 'returns a not found message' do
        expect(response).to have_http_status(404)
        expect(json['error']).to match('Record Not Found')
      end
    end
  end

  describe 'POST /api/v1/users' do
    let(:valid_attributes) do
      {
        email: Faker::Internet.email,
        password: "qwerty",
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        phone: Faker::PhoneNumber.phone_number_with_country_code,
        role: "basic",
        company: company_id
      }
    end

    context 'when the request is invalid' do
      before { post '/api/v1/users', params: {} }

      it 'returns invalid request' do
        expect(response).to have_http_status(400)
        expect(json['error']).not_to be_nil
      end
    end

    context 'when the request is valid' do
      before { post '/api/v1/users', params: valid_attributes }

      it 'returns success with new user' do
        expect(response).to have_http_status(201)
        expect(json['id']).not_to be_nil
        expect(json['first_name']).to eq(valid_attributes[:first_name])
        expect(json['last_name']).to eq(valid_attributes[:last_name])
        expect(json['phone']).to eq(valid_attributes[:phone])
        expect(json['role']).to eq("basic")
      end
    end
  end

  describe 'PUT /api/v1/users/:id' do
    let(:valid_attributes) do
      {
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        phone: Faker::PhoneNumber.phone_number_with_country_code,
        role: "admin"
      }
    
    
    end
    before { put "/api/v1/users/#{user_id}", params: valid_attributes }

    context 'when the user is not found' do
      let(:user_id) { 'fake' }

      it 'returns user not found' do
        expect(response).to have_http_status(404)
        expect(json['error']).to match('Record Not Found')
      end
    end

    context 'when the request is invalid' do
      let(:valid_attributes) do
        {
          first_name: {first_name: 'boy'}
        }
      end

      it 'returns invalid request' do
        expect(response).to have_http_status(400)
        expect(json['error']).not_to be_nil
      end
    end

    context 'when the request is valid' do
      it 'returns success with updated company' do
        expect(response).to have_http_status(200)
        expect(json['id']).to eq(user_id)
        expect(json['first_name']).to eq(valid_attributes[:first_name])
        expect(json['last_name']).to eq(valid_attributes[:last_name])
        expect(json['phone']).to eq(valid_attributes[:phone])
        expect(json['role']).to eq("admin")
      end
    end
  end

  describe 'DELETE /api/v1/users/:id' do
    before { delete "/api/v1/users/#{user_id}" }
    

    context 'when the record exists' do
      it 'returns the user' do
        expect(response).to have_http_status(200)
        expect(json).to match(true)
      end
    end

    context 'when the record does not exist' do
      let(:user_id) { 'fake' }

      it 'returns a not found message' do
        expect(response).to have_http_status(404)
        expect(json['error']).to match('Record Not Found')
      end
    end
  end
end

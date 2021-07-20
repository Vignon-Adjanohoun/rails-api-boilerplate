# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::V1::Companies, type: :request do
  let!(:companies) { FactoryBot.create_list(:company, 5) }
  let(:company) { companies[0] }
  let(:company_id) { company.id.to_str }

  describe 'GET /api/v1/companies' do
    before { get '/api/v1/companies' }

    it 'returns list of all companies' do
      expect(response).to have_http_status(200)
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
      
      expect(json[0]['active']).to eq(true)
      expect(json[0]['name']).not_to be_nil
      expect(json[0]['phone']).not_to be_nil
      expect(json[0]['email']).not_to be_nil
    end
  end

  describe 'GET /api/v1/companies/:id' do
    before { get "/api/v1/companies/#{company_id}" }
    

    context 'when the record exists' do
      it 'returns the company' do
        expect(response).to have_http_status(200)
        expect(json).not_to be_nil
        expect(json['active']).to eq(true)
        expect(json['name']).to eq(company.name)
        expect(json['phone']).to eq(company.phone)
        expect(json['email']).to eq(company.email)
      end
    end

    context 'when the record does not exist' do
      let(:company_id) { 'fake' }

      it 'returns a not found message' do
        expect(response).to have_http_status(404)
        expect(json['error']).to match('Record Not Found')
      end
    end
  end

  describe 'POST /api/v1/companies' do
    let(:valid_attributes) do
      {
        name: Faker::Company.name,
        phone: Faker::PhoneNumber.phone_number_with_country_code,
        email: Faker::Internet.email
      }
    end

    # context 'when the request is unauthorized' do
    #   before { post '/api/v1/companies', params: valid_attributes, headers: { 'User-Key' => '' } }

    #   it 'returns unauthorized' do
    #     expect(response).to have_http_status(401)
    #   end
    # end

    context 'when the request is invalid' do
      before { post '/api/v1/companies', params: {} }

      it 'returns invalid request' do
        expect(response).to have_http_status(400)
        expect(json['error']).not_to be_nil
      end
    end

    context 'when the request is valid' do
      before { post '/api/v1/companies', params: valid_attributes }

      it 'returns success with new company' do
        expect(response).to have_http_status(201)
        expect(json['id']).not_to be_nil
        expect(json['active']).to eq(true)
      end
    end
  end

  describe 'PUT /api/v1/companies/:id' do
    let(:valid_attributes) do
      {
        name: Faker::Company.name,
        phone: Faker::PhoneNumber.phone_number_with_country_code,
        email: Faker::Internet.email
      }
    
    
    end
    before { put "/api/v1/companies/#{company_id}", params: valid_attributes }

    context 'when the company is not found' do
      let(:company_id) { 'fake' }

      it 'returns company not found' do
        expect(response).to have_http_status(404)
        expect(json['error']).to match('Record Not Found')
      end
    end

    context 'when the request is invalid' do
      let(:valid_attributes) do
        {
          name: {name: 1}
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
        expect(json['id']).to eq(company_id)
        expect(json['active']).to eq(true)
        expect(json['name']).to eq(valid_attributes[:name])
        expect(json['phone']).to eq(valid_attributes[:phone])
        expect(json['email']).to eq(valid_attributes[:email])
      end
    end
  end

  describe 'DELETE /api/v1/companies/:id' do
    before { delete "/api/v1/companies/#{company_id}" }
    

    context 'when the record exists' do
      it 'returns the company' do
        expect(response).to have_http_status(200)
        expect(json).to match(true)
      end
    end

    context 'when the record does not exist' do
      let(:company_id) { 'fake' }

      it 'returns a not found message' do
        expect(response).to have_http_status(404)
        expect(json['error']).to match('Record Not Found')
      end
    end
  end
end

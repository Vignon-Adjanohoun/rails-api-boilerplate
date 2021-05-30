# frozen_string_literal: true

module API::V1
  class Companies < Grape::API
    include API::V1::Defaults

    resource :companies do

      desc 'Return companies list'
      get do
        records = Company.all.to_a
        CompanyBlueprint.render_as_json(records)
      end

      desc 'Return a company'
      params do
        requires :id, type: String, desc: 'Id of company'
      end
      get ':id' do
        record = Company.find(permitted_params[:id])
        record_not_found! unless record
        CompanyBlueprint.render_as_json(record) 
      end

      desc 'Create new Company'
      params do
        build_with Grape::Extensions::Hash::ParamBuilder
        requires :name, type: String, desc: 'Name of the company'
      end
      post do
        record = Company.create(@permitted_params)
        CompanyBlueprint.render_as_json(record)
      end

      desc 'Update  Company'
      params do
        build_with Grape::Extensions::Hash::ParamBuilder
        requires :id, type: String, desc: 'Id of company'
        optional :name, type: String, desc: 'Name of the company'
      end
      put ':id' do
        record = Company.find(permitted_params[:id])
        record_not_found! unless record
        record.update_attributes(@permitted_params)
        CompanyBlueprint.render_as_json(record)
      end

      desc 'Delete a company'
      params do
        requires :id, type: String, desc: 'Id of company'
      end
      delete ':id' do
        Company.find(permitted_params[:id]).destroy
      end
    end
  end
end

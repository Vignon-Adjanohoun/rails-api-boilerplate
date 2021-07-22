# frozen_string_literal: true

module API::V1
  class Users < Grape::API
    include API::V1::Defaults

    resource :users do

      desc 'Return a users of company'
      params do
        requires :id, type: String, desc: 'Id of user'
      end
      get 'company/:id' do
        c_record = Company.find(permitted_params[:id])
        record_not_found! unless c_record
        record = c_record.users.to_a
        UserBlueprint.render_as_json(record) 
      end

      desc 'Return a user'
      params do
        requires :id, type: String, desc: 'Id of user'
      end
      get ':id' do
        record = User.find(permitted_params[:id])
        record_not_found! unless record
        UserBlueprint.render_as_json(record) 
      end

      desc 'Create new user'
      params do
        build_with Grape::Extensions::Hash::ParamBuilder
        requires :first_name, type: String, desc: 'First name of the user'
        requires :last_name, type: String, desc: 'Last name of the user'
        requires :email, type: String, desc: 'Email of the user'
        optional :phone, type: String, desc: 'Phone of the user'
        optional :role, type: String, desc: 'role of the user'
        requires :company, type: String, desc: 'company of the user'
      end
      post do
        record = User.create(permitted_params)
        UserBlueprint.render_as_json(record)
      end

      desc 'Update a user'
      params do
        build_with Grape::Extensions::Hash::ParamBuilder
        requires :id, type: String, desc: 'Id of user'
        optional :first_name, type: String, desc: 'First name of the user'
        optional :last_name, type: String, desc: 'Last name of the user'
        optional :phone, type: String, desc: 'Phone of the user'
        optional :role, type: String, desc: 'role of the user'
      end
      put ':id' do
        record = User.find(permitted_params[:id])
        record_not_found! unless record
        record.update_attributes(@permitted_params)
        UserBlueprint.render_as_json(record)
      end

      desc 'Delete a user'
      params do
        requires :id, type: String, desc: 'Id of user'
      end
      delete ':id' do
        User.find(permitted_params[:id]).destroy
      end
    end
  end
end

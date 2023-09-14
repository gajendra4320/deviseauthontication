# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  privatea

  def respond_with(resource, option={})
    debugger
    if resource.persisted?
      render json: {
        status: {code: 200, message:'Signed up successfully',
          data: resource}
      }, status: :ok
    else
      debugger
      render json: {
        status: {message: 'users could not be created successfully', errors: resource.errors.full_message}, status: :unprocessable_entity
      }
    end
  end
end

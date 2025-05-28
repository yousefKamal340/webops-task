module Api
  module V1
    class AuthenticationController < ApplicationController
      skip_before_action :authenticate_request, only: [:login, :signup]

      def signup
        user = User.new(user_params)
        
        if user.save
          token = AuthenticationService.encode_token(user_id: user.id)
          render json: { token: token, user: user }, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def login
        user = User.find_by(email: params[:email])
        
        if user&.authenticate(params[:password])
          token = AuthenticationService.encode_token(user_id: user.id)
          render json: { token: token, user: user }
        else
          render json: { error: 'Invalid credentials' }, status: :unauthorized
        end
      end

      private

      def user_params
        params.permit(:name, :email, :password, :password_confirmation, :image)
      end
    end
  end
end 
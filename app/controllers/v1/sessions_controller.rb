class V1::SessionsController < ApplicationController
    def create
        user = User.where(email: params[:email]).first
        #Devise's valid_password method checks the password is correct then JSON is returned
        if user && user.valid_password?(params[:password])
            render json: user.as_json(only: [:email]), status: :created
        else
            #if user is not authorized, the header will return unauthorized
            head(:unauthorized)
        end
    end

    def destroy

    end
end
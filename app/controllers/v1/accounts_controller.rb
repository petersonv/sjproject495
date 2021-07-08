class V1::AccountsController < ApplicationController
    def index
        @accounts = Account.all
        render json: @accounts, status: 200
    end

    def create
        @account = Account.new(account_params)

        @account.save 
        render json: @account, status: :created
    end

    def destroy
        @account = Account.where(id: params[:id]).first
        if @account.destroy
        #head returns only header contents   
            head(:ok)
        else
            head(:unprocessable_entity)
        end

    end

    private

    def account_params
        params.require(:account).permit(:first_name, :last_name, :email)
    end
end

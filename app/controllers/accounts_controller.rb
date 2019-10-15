class AccountsController < ApplicationController

  def index
  end

  def show
    @user = User.find(current_user.id)
    @account = Account.find(user_id: @user.id)
    @account_transactions = AccountTransaction.where(account_id: @account.id)
  end
  
end

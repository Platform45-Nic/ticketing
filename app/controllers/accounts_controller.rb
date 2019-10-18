class AccountsController < ApplicationController

  def index
  end

  def show
    @user = User.find(current_user.id)
    @account = Account.find_by(user_id: @user.id)
    @account_transactions = AccountTransaction.where(account_id: @account.id)
  end
  
end

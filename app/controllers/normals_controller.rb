class NormalsController < ApplicationController

  def index
  end

  def show
    @user = User.find(current_user.id)
    if @account = Account.find(user_id: @user.id).blank?
      account_init
    else
      @account = Account.find(user_id: @user.id)
      @account_transactions = AccountTransaction.where(account_id: @account.id)
    end
  end

  private
  
  def account_init
    if current_user.present? && current_user.type == "Normal"
      @account_new = Account.new(user_id: User.find(current_user.id).id, amount: 100).save
      AccountTransaction.new(amount: 100, account_id: @account_new.id.to_i, note: "initialization").save
    end
  end

end

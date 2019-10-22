class NormalsController < ApplicationController
  # include NormalsHelper
  # skip_before_action :account_init, except: :show

  def index
  end

  def show
    @user = User.find(current_user.id)
    @account = @user.account
    if @account = Account.find_by(user_id: @user.id).blank?
      account_init
    else
      @account = Account.find_by(user_id: @user.id)
      @account_transactions = AccountTransaction.where(account_id: @account.id)
    end
  end

  private
  
  def account_init
    if current_user.present? && current_user.type == "Normal"
      if Account.new(user_id: User.find(current_user.id).id, amount: 100).save
        AccountTransaction.new(amount: 100, account_id: Account.find_by(user_id: User.find(current_user.id).id).id, note: "initialization").save
      end
    end
  end

end

class NormalsController < ApplicationController
  # include NormalsHelper
  # skip_before_action :account_init, except: :show

  def index
  end

  def show
    @user = User.find(current_user.id)
    @account = Account.find_by(user_id: @user.id)
    @account_transactions = AccountTransaction.where(account_id: @account.id)
  end

end

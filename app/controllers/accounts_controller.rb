class AccountsController < ApplicationController

  def show
    @user = User.find(current_user.id)
    @account = Account.find_by(user_id: @user.id)
    @account_transactions = AccountTransaction.where(account_id: @account.id)
  end
  
  def update
    @account = Account.find_by(user_id: params[:id])
    @account.update(amount: @account.amount + 100)
    if @account.save
      flash[:success] = "Your Account has been Topped Up with 100 Credit's."
      redirect_to normals_profile_path
    else
      flash.now[:error] = "There was a problem Topping Up this Account."
      redirect_to normals_profile_path
    end
  end

end

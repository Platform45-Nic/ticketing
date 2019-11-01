class AccountCreator
  def initialize(params)
    @user = params
  end

  def create_user_account
    @account = Account.new(user_id: @user.id, amount: 100)
    if @account.save
      AccountTransaction.new(amount: 100, account_id: @account.id, note: "initialization").save
    end
  end

end
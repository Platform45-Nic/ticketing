class AccountTransactionsController < ApplicationController

  def index
    @account_transactions = AccountTransaction.all
  end

  def show
    @account_transaction = AccountTransaction.find(params[:id])
  end

  def new
    @account_transaction = AccountTransaction.new
  end

  def create
    @account_transaction = AccountTransaction.new(account_transaction_params)
    if @account_transaction.save
      flash[:success] = "You have created a Account Transaction"
      redirect_to @account_transaction
    else
      render 'new'
    end
  end

  def edit
    @account_transaction = AccountTransaction.find(params[:id])
  end

  def update
    @account_transaction = AccountTransaction.find(params[:id])
    if @account_transaction.update_attributes(account_transaction_params)
      flash[:success] = "You have updated a account_transaction"
      redirect_to @account_transaction
    else
      render 'edit'
    end
  end

  private

    def account_transaction_params
      params.require(:account_transaction).permit(:name, :number_of_tickets, :date, :catagory_id, :description, :creator)
    end

end

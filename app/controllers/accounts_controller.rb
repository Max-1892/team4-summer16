class AccountsController < ApplicationController
  def show
    @account = Account.find(params[:id])
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    respond_to do |format|
      if @account.update(post_params)
        format.html { redirect_to account_path(@account.id), notice: 'Account was successfully updated.' }
      else
        format.html { redirect_to edit_account_path(@account.id), alert: 'Account was not updated.' }
      end
    end
  end

  private
    def post_params
      params.require(:account).permit(:first_name, :last_name, :gender, :age)
    end
end

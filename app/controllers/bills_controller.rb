class BillsController < ApplicationController
	before_action :set_user
	before_action :set_bill, only: [:edit, :update, :destroy]
  
  def new
  	@bill = @user.bills.new
  end

  def create
  	@bill = @user.bills.build(bill_params)
  	if @bill.save
  		redirect_to user_path(@user)
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @bill.update(bill_params)
  		redirect_to user_path(@user)
  	else
  		render :edit
  	end
  end

  def destroy
  	@bill.destroy
  	redirect_to user_path(@user)
  end

  private

  def set_user
  	@user = User.find(params[:user_id])
  end

  def set_bill
  	@bill = Bill.find(params[:id])
  end

  def bill_params
  	params.require(:bill).permit(:duedate, :lender, :description, :category, :amount, :is_paid)
  end
end

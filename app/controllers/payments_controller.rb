class PaymentsController < ApplicationController
  before_action :set_group

  def index
    @payments = Payment.all
    @total_amount = @payments.sum(:amount)
  end

  def show
    @payment = Payment.find(params[:id])
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = current_user.payments.new(payment_params)

    if @payment.save
      if params[:payment][:group_ids].present?
        params[:payment][:group_ids].each do |group_id|
          group = Group.find(params[:group_id])
          group.payments << @payment
        end
      end

      
    else
      puts @payment.errors.full_messages
      render :new
    end
  end

  def edit
    @payment = Payment.find(params[:id])
  end

  def update
    @payment = Payment.find(params[:id])

    if @payment.update(payment_params)
      redirect_to payment_path(@payment), notice: 'Payment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy

    redirect_to payments_path, notice: 'Payment was successfully deleted.'
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def payment_params
    params.require(:payment).permit(:name, :amount, :group_ids => [])
  end  
end

class PaymentsController < ApplicationController
  before_action :set_group

  def index
    @payments = @group.payments.order(created_at: :desc)
    @total_amount = @payments.sum(:amount)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

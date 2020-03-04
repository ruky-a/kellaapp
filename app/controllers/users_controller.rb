class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.all
  end

  def dashboard

  end

  def update
  @user = current_user
  if @user.update_attributes(current_user_params)
    flash[:notice] = "Saved...."
  else
    flash[:alert] = "Cannot Update"
  end 
  redirect_to dashboard_path
end

  def show
 @user = User.find(params[:id])
  end

    def update_payment
    if !current_user.stripe_id
      customer = Stripe::Customer.create(
        email: current_user.email,
        source: params[:stripeToken]
      )
    else
      customer = Stripe::Customer.update(
        current_user.stripe_id,
        source: params[:stripeToken]
      )
    end

    if current_user.update(stripe_id: customer.id, stripe_last_4: customer.sources.data.first)
      flash[:notice] = "New card is saved"
    else
      flash[:alert] = "Invalid card"
    end
    redirect_to request.referrer
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to request.referrer
  end


  private

  def current_user_params
    params.require(:user).permit(:about, :status, :photo)

  end
end

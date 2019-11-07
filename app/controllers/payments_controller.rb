class PaymentsController < ApplicationController

  def index
    @payments = Payment.all.reverse_order!
  end

  def new
    @payment = Payment.create(user: current_user, status: 'registered')
    payment_handler(@payment)
  end

  def pay
    @payment = Payment.find(params[:id])
    payment_handler(@payment)
  end

  def continue
    @payment = Payment.find_by!(payment_id: params[:session_id])
    if Rails.env.production?
      @key = ENV['STRIPE_PUBLIC']
    else
      @key = 'pk_test_6HSBmz2aEV8EbhsqzGgkVG0k001hPm9fuI'
    end
    @payment.update(status: 'pending')
  end

  def cancel
    @payment = Payment.find(params[:id])
    @payment.update(status: 'cancelled')
    redirect_to payments_path
  end

  def success
    @payment = Payment.find(params[:id])
    @payment.update(status: 'success')
    redirect_to payments_path
  end

  private

  def payment_handler(payment)

    if Rails.env.production?
      Stripe.api_key = ENV['STRIPE_PRIVATE']
    else
      Stripe.api_key = 'sk_test_XoiD2AxrV2VH9M2OaolKSKxu00EE181vZS'
    end

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: 'Tip',
        description: 'Pay me Pitos!',
        images: ['http://giphygifs.s3.amazonaws.com/media/96DeW8wUdpN96/giphy.gif'],
        amount: 64,
        currency: 'usd',
        quantity: 1,
      }],
      success_url: "http://localhost:3000/payments/success?id=#{payment.id}",
      cancel_url: "http://localhost:3000/payments/cancel?id=#{payment.id}",
    )

    payment.update!(payment_id: session.id)
    redirect_to "http://localhost:3000/payments/continue?session_id=#{session.id}"
  end

end

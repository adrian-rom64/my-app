class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[continue cancel success]

  def new
    @payment = Payment.create(user: current_user, status: 'registered')
    Stripe.api_key = 'sk_live_sCnsjfNDbXNPYqticDJfg8AK00uUnmNgkY'

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
      success_url: "http://localhost:3000/payments/success?session_id=#{@payment.payment_id}",
      cancel_url: "http://localhost:3000/payments/cancel?session_id=#{@payment.payment_id}",
    )

    @payment.update!(payment_id: session.id)
    redirect_to "http://localhost:3000/payments/continue?session_id=#{session.id}"
  end

  def continue
    @payment.update(status: 'pending')
  end

  def cancel
    @payment.update(status: 'cancelled')
  end

  def success
    @payment.update(status: 'success')
  end

  private

  def set_payment
    @payment = Payment.find_by!(payment_id: params[:session_id])
  end
end

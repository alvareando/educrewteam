class PaymentsController < ApplicationController
  before_action :set_session

  def new
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @session.price_cents,
      description:  "Payment for session #{@session.id}",
      currency:     @session.price.currency
    )
    Payment.create(session_uid: @session.id, payment: charge.to_json, state: 'paid')
    SessionParticipation.create(session: @session, student: current_user)

    redirect_to session_live_path(@session)
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to session_payment_path(@session)
  end

  private

  def set_session
    @session = Session.find(params[:session_id])
  end
end

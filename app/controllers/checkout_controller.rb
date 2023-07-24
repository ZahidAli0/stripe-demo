class CheckoutController < ApplicationController
  def create
    @session = Stripe::Checkout::Session.create({
      success_url: products_url,
      cancel_url: products_url,
      payment_method_types: ['card'],
      line_items: [
        {
          price_data: {
            currency: 'usd',
            unit_amount: 2000,
            product_data: {
              name: 'Product',
              description: 'A cool product',
            }
          },
          quantity: 1
        }
      ],
      mode: 'payment',
      metadata: { product_id: params[:product_id] },
      customer_email: current_user.email,
    })

    # Instead of responding to format.js, you might not need to respond here.
    # If you still need to perform some specific actions on the client-side,
    # you can handle it through JavaScript in your view or a separate .js.erb file.

    # For example, if you need to pass the session ID to the client-side, you can do something like this:
    # respond_to do |format|
    #   format.js { render js: "window.stripeCheckoutSessionId = '#{@session.id}';" }
    # end
  end
end

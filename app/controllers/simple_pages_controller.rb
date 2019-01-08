class SimplePagesController < ApplicationController
  def index
    @products=Product.limit(3).offset(4)
  end

  def landing_page
    @featured_products = Product.limit(3)
    @products = Product.limit(3)
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    ActionMailer::Base.mail(from: @email, to: 'diabolyca1988@gmail.com', subject: "A new contact form message from #{@name}", body: @message).deliver_now
  end


  
end

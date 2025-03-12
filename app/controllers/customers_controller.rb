class CustomersController < ApplicationController
  def index
    if params[:filter] == "missing_email"
      @customers = Customer.where(email: [nil, ""])
    elsif params[:filter] == "alphabetized"
      @customers = Customer.order(:full_name)
    else
      @customers = Customer.all
    end
  end
end
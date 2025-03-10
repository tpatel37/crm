class CustomersController < ApplicationController
  def missing_email
    @customers = Customer.where(email: [nil, ""]) # Find customers with missing emails
    render :index
  end

  def alphabetized
    @customers = Customer.order(:full_name) # Sort customers alphabetically
    render :index
  end
end
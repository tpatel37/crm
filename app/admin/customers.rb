ActiveAdmin.register Customer do
  # Permit only allowed parameters, including image
  permit_params :full_name, :phone_number, :email, :notes, :image

  # Scope for missing email customers
  scope :all, default: true
  scope :missing_email do |customers|
    customers.where(email: [nil, ""])
  end

  # Scope for alphabetized customers
  scope :alphabetized do |customers|
    customers.order(:full_name)
  end

  # Index page configuration
  index do
    selectable_column
    id_column
    column :full_name, sortable: true
    column :phone_number
    column :email
    column :notes
    column :created_at, sortable: true
    column :updated_at

    column "Image" do |customer|
      if customer.image.attached?
        image_tag url_for(customer.image), width: 50, height: 50
      else
        "No Image"
      end
    end
    actions
  end

  # Filters
  filter :full_name
  filter :phone_number
  filter :email
  filter :notes
  filter :created_at
  filter :updated_at

  # Form customization
  form do |f|
    f.inputs "Customer Details" do
      f.input :full_name, label: "Full Name"
      f.input :email
      f.input :phone_number, label: "Phone Number"
      f.input :notes
      f.input :image, as: :file  # Add file upload for image
    end
    f.actions
  end

  # Show page configuration
  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email
      row :notes
      row :created_at
      row :updated_at
      row "Image" do |customer|
        if customer.image.attached?
          image_tag url_for(customer.image), width: 100, height: 100
        else
          "No Image"
        end
      end
    end
  end

  # Custom member action for deleting customer
  member_action :destroy, method: :delete do
    resource.destroy
    redirect_to admin_customers_path, notice: "Customer was successfully deleted."
  end
end
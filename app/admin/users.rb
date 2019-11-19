# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :firstname, :lastname, :password, :address, :postalcode, :city, :province, :email
end

# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :name, :password, :address, :postalcode, :city, :province, :email
end

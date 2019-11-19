# frozen_string_literal: true

ActiveAdmin.register Product do
  permit_params :productname, :description, :price, :quantity, :image, :category_id
end

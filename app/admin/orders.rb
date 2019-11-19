# frozen_string_literal: true

ActiveAdmin.register Order do
  permit_params :product_id, :user_id
end

# frozen_string_literal: true

ActiveAdmin.register Category do
  permit_params :categoryname
end

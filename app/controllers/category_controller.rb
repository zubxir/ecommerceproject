# frozen_string_literal: true

class CategoryController < ApplicationController
  def index
    @category = Category.order(:categoryname).page(params[:page])
  end

  def show
    item = Product.joins(:category).where('categoryname LIKE ?', '%Health%').order(:name).page(params[:page])
    @product = item || Product.order(:name).page(params[:page])
  end
end

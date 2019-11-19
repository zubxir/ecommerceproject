# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    if params[:search]
      case params['options'].to_i
      when 1
        item = Product.where('productname LIKE ?', "%#{params[:search]}%").order(:name).page(params[:page])
        @product = item || Product.order(:name).page(params[:page])
      when 2
        item = Product.joins(:category).where('categoryname LIKE ?', '%Health%').order(:name).page(params[:page])
        @product = item || Product.order(:name).page(params[:page])
      when 3
        item = Product.joins(:category).where('categoryname LIKE ?', '%Flu%').order(:name).page(params[:page])
        @product = item || Product.order(:name).page(params[:page])
      when 4
        item = Product.joins(:category).where('categoryname LIKE ?', '%Sleep%').order(:name).page(params[:page])
        @product = item || Product.order(:name).page(params[:page])
      when 5
        item = Product.joins(:category).where('categoryname LIKE ?', '%Topical%').order(:name).page(params[:page])
        @product = item || Product.order(:name).page(params[:page])

      end
    else
      @product = Product.order(:productname).page(params[:page])
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end

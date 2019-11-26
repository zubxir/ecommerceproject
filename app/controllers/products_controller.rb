# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :initialize_session
  before_action :authenticate_user!
  before_action :load_cart

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
      @product = Product.order(:productname).page(params[:page]).per(5)
    end
  end

  def add_to_cart
    id = params[:id].to_i

    session[:cart] << id unless session[:cart].include?(id)
    redirect_to root_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to root_path
  end

  def subtotal(total); end

  def show
    @product = Product.find(params[:id])
  end

  def load_cart
    @cart = Product.find(session[:cart])
  end

  def destroy
    @cart = session[:cart] = nil
  end

  private

  def initialize_session
    session[:cart] ||= []
  end
end

class CategoriesController < ApplicationController
  before_action :authenticate_user

  def show
    @category = current_user.categories.find_by(id: params["id"])
    render :show
  end

  def index
    @categories = current_user.categories
    render :index
  end

  def create
    @category = Category.new(
      name: params["name"] || "Unsorted",
    )
    @category.save
    if @category.valid?
      render :show
    else
      render json: { errors: @category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @category = current_user.categories.find_by(id: params["id"])
    @category.update(
      name: params["name"] || @category.name,
    )
    if @category.valid?
      render :show
    else
      render json: { errors: @category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    category = current_user.categories.find_by(id: params["id"])
    category.delete
    render json: { message: "successfully deleted" }
  end
end

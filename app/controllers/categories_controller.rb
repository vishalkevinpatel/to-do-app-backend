class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(id: params["id"])
    render :show
  end

  def index
    @categories = Category.all
    render :index
  end

  def create
    @category = Category.new(
      name: params["name"],
    )
    @category.save
    if @category.valid?
      render :show
    else
      render json: { errors: @category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @category = Category.find_by(id: params["id"])
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
    category = Category.find_by(id: params["id"])
    category.delete
    render json: { message: "successfully deleted" }
  end
end

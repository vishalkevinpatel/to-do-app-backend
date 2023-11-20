class TodosController < ApplicationController
  # before_action :authenticate_admin, except: [:index, :show]

  def show
    @todo = Todo.find_by(id: params["id"])
    render :show
  end

  def index
    @todos = Todo.all
    render :index
  end

  def create
    @todo = Todo.new(
      user_id: params["user_id"],
      title: params["title"],
      description: params["description"],
      deadline: params["deadline"],
      completed: params["completed"],
      category_id: params["category_id"],
    )
    @todo.save
    if @todo.valid?
      render :show
    else
      render json: { errors: @todo.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @todo = Todo.find_by(id: params["id"])
    @todo.update(
      user_id: params["user_id"] || @todo.name,
      title: params["title"] || @todo.price,
      description: params["description"] || @todo.description,
      deadline: params["deadline"] || @todo.inventory,
      completed: params["completed"] || @todo.supplier_id,
      category_id: params["category_id"] || @todo.supplier_id,
    )
    if @todo.valid?
      render :show
    else
      render json: { errors: @todo.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    todo = Todo.find_by(id: params["id"])
    todo.delete
    render json: { message: "successfully deleted" }
  end
end

class TodosController < ApplicationController
  before_action :authenticate_user

  def show
    @todo = current_user.todos.find_by(id: params["id"])
    render :show
  end

  def index
    @todos = current_user.todos
    render :index
  end

  def create
    @todo = Todo.new(
      user_id: current_user.id,
      title: params["title"],
      description: params["description"],
      deadline: params["deadline"],
      completed: false,
      category_id: params["category_id"] || 3,
    )
    @todo.save
    if @todo.valid?
      render :show
    else
      render json: { errors: @todo.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @todo = current_user.todos.find_by(id: params["id"])
    @todo.update(
      user_id: params["user_id"] || @todo.user_id,
      title: params["title"] || @todo.title,
      description: params["description"] || @todo.description,
      deadline: params["deadline"] || @todo.deadline,
      completed: params["completed"] || @todo.completed,
      category_id: params["category_id"] || @todo.category_id,
    )
    if @todo.valid?
      render :show
    else
      render json: { errors: @todo.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    todo = current_user.todos.find_by(id: params["id"])
    todo.delete
    render json: { message: "successfully deleted" }
  end
end

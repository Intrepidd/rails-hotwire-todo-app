class TodosController < ApplicationController
  before_action :set_todo, only: %i[edit update toggle destroy]

  def index
    @todo = Todo.new
    @active_todos = Todo.active.ordered
    @completed_todos = Todo.completed.ordered
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to todos_path
    else
      redirect_to todos_path, alert: @todo.errors.full_messages.to_sentence
    end
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      redirect_to todos_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def toggle
    @todo.update!(completed: !@todo.completed)
    redirect_to todos_path
  end

  def destroy
    @todo.destroy!
    redirect_to todos_path
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:name)
  end
end

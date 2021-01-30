class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /todos
  # GET /todos.json
  def index
    @todos = Todo.all
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    # @todo = Todo.new
    @todo = current_user.todos.build
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  # POST /todos.json
  def create
    # @todo = Todo.new(todo_params)
    @todo = current_user.todos.build(todo_params)

    respond_to do |format|
      if @todo.save
        # format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
        format.html { redirect_to @todo}
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        # format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.html { redirect_to @todo}
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo.destroy
    respond_to do |format|
      # format.html { redirect_to todos_url, notice: 'Todo was successfully destroyed.' }
      format.html { redirect_to todos_url}
      format.json { head :no_content }
    end 
  end

  def correct_user 
    @todo = current_user.todos.find_by(id: params[:id])
    redirect_to todos_path, notice: "Not Authorized To Edit This" if @todo.nil?
  end 

  # def search
  #   @todo = current_user.todos.where("tags LIKE ?", "%" + params[:q] + "%")
  # end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.require(:todo).permit(:task, :completed, :tags, :user_id)
    end



  end

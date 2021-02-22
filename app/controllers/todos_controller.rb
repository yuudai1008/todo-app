class TodosController < ApplicationController
  #before_actionで,アクション前に実行されるメソッドを定義しています。
#参考:https://qiita.com/ebi_death/items/3912630e32268c9cce46  
before_action :authenticate_user!
before_action :set_goal
before_action :set_todo, only: [:show, :edit, :update, :destroy, :sort]
  

  # GET /todos/new
  def new
    #@goalに紐付いたtodosをnewしています
    @todo = @goal.todos.new
  end

  # GET /todos/1/edit
  def edit
  end
  
  def sort
  end

  # POST /todos
  def create
    @todo = @goal.todos.new(todo_params)

    if @todo.save
      @status = true
    else
      @status = false
    end
  end

  # PATCH/PUT /todos/1
  def update
    # todo_paramsはこのクラスのprivate以下で定義しています。
    if @todo.update(todo_params)
      @status = true
    else
      @status = false
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
    
  end

  private
    
    def set_goal
     @goal = current_user.goals.find_by(id: params[:goal_id])
     redirect_to(goals_url, alert: "ERROR!!") if @goal.blank?
    end

    def set_todo
      @todo = @goal.todos.find_by(id: params[:id])
    end

    def todo_params
      params.require(:todo).permit(:content, :goal_id, :position, :done, tag_id: [])
    end
end

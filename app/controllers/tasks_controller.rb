class TasksController < ApplicationController
  def new
    @relation= Relation.find(params[:relation_id])
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(relation_id: params[:relation_id], name: params[:task][:name])
    @task.save 
    redirect_to current_user 
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

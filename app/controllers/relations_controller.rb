class RelationsController < ApplicationController

  def new
  end

  def create
    @partner = User.find_by(email: params[:email])
    @user = User.find_by(id: params[:user_id])
    @active = Relation.new(user_id: @user.id, patner_id: @partner.id)
    @active.save
  end

  def destroy
  end

  def complete
    @relation= Relation.find(params[:id])                                                             
  end

  def verify
    @relation = Relation.find(params[:relation_id]) 
    @partner = User.find_by(email: params[:email]) 
    if (@partner.id == @relation.patner_id &&  params[:relation_id] == params[:account_id])
      @relation.update_attributes(verified: true)
      redirect_to @partner
    else
      puts "not verified"
      render 'complete'
    end
  end
end
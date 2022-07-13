class PagesController < ApplicationController
  before_action :set_task!
  before_action :authenticate_user! 
  def home

    @tasks = Task.all
  end

  def admin 
  end

  def new 
  end

  private 
  # def set_task

  #   @tasks = Task.all
  # end


  def authenticate_admin!
    redirect_to root_path unless current_user.admin?
  end
end

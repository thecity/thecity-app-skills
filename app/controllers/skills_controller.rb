class SkillsController < ApplicationController

  def index
    @skills = Skill.order('name ASC')
  end


  def show
    @skill = Skill.includes(:users).find(params[:id])
    
    @users = @skill.users * 10
  end

  
  def search
    @users = []
    if params[:query].present?
      @users = User.search_for(params[:query]).order('first_name ASC')
    end
  end


  def email_new
    # nothing to do here
  end

  def send_email
    if params[:user_id].present? and params[:message].present? and User.exists?(params[:user_id])
      user = User.find(params[:user_id])
      UserMailer.welcome_email(@user).deliver
    end
  end


end

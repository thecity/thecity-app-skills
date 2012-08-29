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
      user = User.find_by_id(params[:user_id])

      if user.nil?
        @errors = 'User not found'
      else
        UserMailer.you_have_mail(user, params[:message]).deliver
      end
    end
  end


end

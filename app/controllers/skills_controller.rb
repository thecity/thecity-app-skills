class SkillsController < ApplicationController

  def index
    @skills = Skill.order('name ASC')
  end


  def show
    @skill = Skill.includes(:users).find(params[:id])
    
    @users = @skill.users
  end

end

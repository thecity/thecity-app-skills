class SkillsController < ApplicationController

  def index
    #TheCity::AdminApi.connect(TCA_KEY, TCA_TOKEN)

    # skill_list = TheCity::SkillList.new
    # if skill_list.empty?
    #   @data = "No skils in list"
    # else
    #   @data = "Skills: #{skill_list.skills.inspect}"
    # end

    @skills = Skill.order('name ASC')

  end


  def show
    @skill = Skill.includes(:users).find(params[:id])
    @users = @skill.users
  end

end

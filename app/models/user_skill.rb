class UserSkill < ActiveRecord::Base
  attr_accessible :skill_id, :user_id

  belongs_to :skill, :counter_cache => :user_count  
  belongs_to :user
end

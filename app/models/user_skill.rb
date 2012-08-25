class UserSkill < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :skill
  belongs_to :user
end

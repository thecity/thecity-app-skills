class Skill < ActiveRecord::Base
  attr_accessible :external_id, :name

  has_many :user_skills, :dependent => :destroy
  has_many :users, :through => :user_skills
end

class User < ActiveRecord::Base
  attr_accessible :external_id,
                  :active, 
                  :first_name, 
                  :nickname,
                  :last_name, 
                  :gender, 
                  :email,
                  :primary_phone,
                  :primary_phone_type,
                  :secondary_phone,
                  :secondary_phone_type,
                  :primary_campus,
                  :memberized_at,
                  :last_engaged_at,
                  :last_logged_in_at

  has_many :user_skills, :dependent => :destroy
  has_many :skills, :through => :user_skills  
end

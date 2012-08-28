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


  scoped_search :in => :skills, :on => [:name]

  def full_name
    fname = self.nickname.nil? ? self.first_name : self.nickname
    [fname, self.last_name].join(' ')
  end
  
end

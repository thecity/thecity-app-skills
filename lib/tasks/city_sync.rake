namespace :city do

  namespace :sync do
    desc 'Sync the local database of skills with The City.'
    task :skills => :environment do
      puts 'syncing skills....'
      TheCity::AdminApi.connect(TCA_KEY, TCA_TOKEN)

      city_skill_ids = []
      done = false
      page = 1
      while !done
        skill_list = TheCity::SkillList.new({:page => page})

        skill_list.each do |city_skill|
          city_skill_ids << city_skill.id
          if Skill.where(:external_id => city_skill.id).exists?
            puts "Found #{city_skill.name} (#{city_skill.id})"
          else
            Skill.create({:external_id => city_skill.id, :name => city_skill.name})
            puts "Created #{city_skill.name}"
          end
        end

        if skill_list.total_pages <= page
          done = true
        else
          page += 1
          puts "### => Page #{page}/#{skill_list.total_pages}"
        end
      end

      Skill.where(['external_id NOT IN(?)', city_skill_ids]).each do |skill|
        skill.destroy
        puts "Removed #{skill.name}"
      end

      puts 'done'
    end



    desc 'Sync the local database of users with The City.'
    task :users => :environment do
      puts 'syncing users....'
      TheCity::AdminApi.connect(TCA_KEY, TCA_TOKEN)

      city_user_ids = []
      done = false
      page = 1
      while !done
        user_list = TheCity::UserList.new({:page => page})

        user_list.each do |city_user|
          city_user_ids << city_user.id
          if User.where(:external_id => city_user.id).exists?
            puts "Found #{city_user.full_name}"
          else
            begin
              User.create({:external_id => city_user.id, 
                           :active => city_user.active,
                           :first_name => city_user.first,
                           :nickname => city_user.nickname,
                           :last_name => city_user.last,
                           :gender => city_user.gender,
                           :email => city_user.email,
                           :primary_phone => city_user.primary_phone,
                           :primary_phone_type => city_user.primary_phone_type,
                           :secondary_phone => city_user.secondary_phone,
                           :secondary_phone_type => city_user.secondary_phone_type,
                           :primary_campus => city_user.primary_campus_name,
                           :memberized_at => clean_date(city_user.member_since),
                           :last_engaged_at => clean_date(city_user.last_engaged),
                           :last_logged_in_at => clean_date(city_user.last_logged_in)})

              puts "Created #{city_user.full_name}"
            rescue
              puts "Failed to create user #{city_user.full_name}"
            end
          end


          user = User.find_by_external_id(city_user.id)
          unless user.nil?
            city_user.skills.each do |user_skill|
              # skill = Skill.find_by_external_id(user_skill.skill_id)
              skill = Skill.find_by_name(user_skill.name)
              unless skill.nil? or UserSkill.where({:user_id => user.id, :skill_id => skill.id}).exists?
                puts "  - #{skill.name} ADDED"
                UserSkill.create({:user_id => user.id, :skill_id => skill.id})
              end
            end
          end
        end

        if user_list.total_pages <= page
          done = true
        else
          page += 1
          puts "### => Page #{page}/#{user_list.total_pages}"
        end
      end

      User.where(['external_id NOT IN(?)', city_user_ids]).each do |user|
        skill.destroy
        puts "Removed #{user.full_name}"
      end

      puts 'done'
    end
  end

  

  desc 'Sync the local database of skills and users with The City.'
  task :sync => ['sync:skills', 'sync:users']



  def clean_date(date)
    if date.blank?
      nil
    elsif date.include?('UTC')
      DateTime.strptime(date,'%m/%d/%Y %I:%M %p')
    else
      Date.strptime(date, '%m/%d/%Y')
    end
  end

end
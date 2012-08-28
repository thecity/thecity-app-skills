module SkillsHelper

  def display_phone_numbers(user)
    phones = []
    unless user.primary_phone.blank?
      ltr = user.primary_phone_type.first.downcase
      phones << "(#{ltr}) #{user.primary_phone}"
    end

    unless user.secondary_phone.blank?
      ltr = user.secondary_phone_type.first.downcase
      phones << "(#{ltr}) #{user.secondary_phone}"
    end

    phones.empty? ? 'N/A' : phones.join('<br>').html_safe
  end


  def display_time(t)
    return 'Unknown' if t.nil?
    t.class == DateTime ? t.to_s(:short_stamp) : t.to_s(:basic_date)
  end


  def display_options(user)
    skills = user.skills.collect { |s| s.name }.join('||')
    
    [ link_to_function('Skills', 'show_user_skills_list( $(this) )') + 
        hidden_field_tag("user_#{user.id}", skills, {:class => 'skills'} ),
      link_to('Email', email_new_skill_path) + 
        hidden_field_tag("user_email_#{user.id}", user.id, {:class => 'user_id'}) ].join(' | ').html_safe
  end

end

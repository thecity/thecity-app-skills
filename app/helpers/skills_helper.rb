module SkillsHelper

  def display_phone_numbers(user)
    return ''
  end

  def display_time(t)
    return 'Unknown' if t.nil?
    t.class == DateTime ? t.to_s(:short_stamp) : t.to_s(:basic_date)
  end

  def display_options(user)
    'Skills | Email'
  end

end

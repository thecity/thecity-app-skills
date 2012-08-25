# used for displaying the date throughout the application. Since some database fields are 
# both of type Date and DateTime add  the format to both. 
Time::DATE_FORMATS[:basic_date] = "%m/%d/%Y"
Date::DATE_FORMATS[:basic_date] = "%m/%d/%Y"

# Time::DATE_FORMATS[:week] = "%m/%d"
# Date::DATE_FORMATS[:week] = "%m/%d"

Time::DATE_FORMATS[:basic_time] = "%I:%M %p"
Date::DATE_FORMATS[:basic_time] = "%I:%M %p"

# Time::DATE_FORMATS[:military_time] = "%H:%M"
# Date::DATE_FORMATS[:military_time] = "%H:%M"

# Time::DATE_FORMATS[:full_stamp] = "%a %B %d at %I:%M %p"
Time::DATE_FORMATS[:short_stamp] = '%D %l:%M %p' # shorter than :full_stamp to conserve column space (and no seconds)



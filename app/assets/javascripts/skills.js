function show_user_skills_list(elem) {
  skills = elem.parents('tr').find('td:last .skills').val().split('||');
  skills = skills.join("\n");
  alert("Should show user skills list here for " + elem.parents('tr').find('td:first').html() + ":\n" + skills );
}


function show_user_email_form(elem) {
  user_id = elem.parents('tr').find('td:last .user_id').val();
  alert("Should show user email form here for " + elem.parents('tr').find('td:first').html() + ":\nWith user_id " + user_id);
}
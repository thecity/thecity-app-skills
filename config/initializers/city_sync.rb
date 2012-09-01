if %w(development test).include?(Rails.env)
  config_file = Rails.root.join('config', 'city_keys.yml')

  if File.exists?(config_file)
    yaml_data = YAML::load(File.open(config_file))
    TCA_KEY = yaml_data[Rails.env]['tca_key']
    TCA_TOKEN = yaml_data[Rails.env]['tca_token']
  end

else
  TCA_KEY = ENV['TCA_KEY']
  TCA_TOKEN = ENV['TCA_TOKEN']
end

TCA_ENV = Rails.env

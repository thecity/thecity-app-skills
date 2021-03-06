class DatabaseSetup < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.integer :external_id, :null => false
      t.boolean :active, :default => true, :null => false
      t.string :first_name
      t.string :nickname
      t.string :last_name
      t.string :gender
      t.string :email
      t.string :primary_phone
      t.string :primary_phone_type
      t.string :secondary_phone
      t.string :secondary_phone_type
      t.string :primary_campus
      t.datetime :memberized_at
      t.datetime :last_engaged_at
      t.datetime :last_logged_in_at
    end

    create_table :skills do |t|
      t.integer :external_id, :null => false
      t.string :name, :null => false
      t.integer :user_count, :null => false, :default => 0
    end

    create_table :user_skills do |t|
      t.integer :skill_id
      t.integer :user_id
    end    
  end

  def down
    drop_table :users
    drop_table :skills
    drop_table :user_skills
  end
end

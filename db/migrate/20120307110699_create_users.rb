class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    t.string :firstname
    t.string :lastname
    t.string :email
    t.boolean :is_active
    t.string :password
   
    t.boolean :password_reset
    t.datetime :last_login, :default=>Time.now
    t.boolean  :is_approved
    t.integer  :approved_by

    t.timestamps
    end
  end
end

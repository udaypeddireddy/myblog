class CreateOrgnizationProfiles < ActiveRecord::Migration
  def change
    create_table :orgnization_profiles do |t|
      t.boolean :is_admin , :default=>false
      t.string  :user_type
      t.integer :user_id
      t.string :role
      
      t.timestamps
    end
  end
end

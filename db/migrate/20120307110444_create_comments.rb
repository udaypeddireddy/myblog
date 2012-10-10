class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      
      t.integer :entry_id
      t.integer :user_id
      t.text :comment
      t.boolean :is_active

      t.timestamps
    end
  end
end

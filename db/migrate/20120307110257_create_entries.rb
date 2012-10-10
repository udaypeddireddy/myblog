class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
     
     t.integer :category_id
     t.string :subject
     t.text :body
     t.boolean :is_active

      t.timestamps
    end
  end
end

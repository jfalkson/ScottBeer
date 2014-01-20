class Comments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer  :beer_id
      t.text     :message
      
      t.timestamps
    end
  end
end

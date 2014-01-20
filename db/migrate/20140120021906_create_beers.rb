class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :title
      t.string :category
      t.integer :rating
      t.string :country
      t.integer :year
      t.string :state_or_province
      t.string :link
      t.integer :user_id
    end
  end
end

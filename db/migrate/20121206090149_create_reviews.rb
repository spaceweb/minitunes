class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :comments
      t.references :user
      t.references :artist
      t.timestamps
    end
  end
end

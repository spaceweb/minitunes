class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :comments
      t.references :tunegoer
      t.references :artist
    end
  end
end
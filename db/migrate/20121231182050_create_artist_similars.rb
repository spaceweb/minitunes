class CreateArtistSimilars < ActiveRecord::Migration
  def change
    create_table :artist_similars do |t|
      t.string :artist_name
      t.string :similar_name
      t.integer :artist_id 
      t.integer :similar_id
      t.timestamps
    end
  end
end

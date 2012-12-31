class CreateArtistSimilars < ActiveRecord::Migration
  def change
    create_table :artist_similars do |t|
      t.text :name
      t.integer :artist_id 
      t.integer :similar_id
      t.timestamps
    end

    add_index :artist_similars, [:artist_id, :similar_id]
  end
end

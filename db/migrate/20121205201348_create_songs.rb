class CreateSongs < ActiveRecord::Migration
  def up
    create_table 'songs' do |t|
      t.string 'name'
      t.integer 'track'
      t.integer 'duration'
      t.string 'link'
    end
  end

  def down
    drop_table 'songs'
  end
end

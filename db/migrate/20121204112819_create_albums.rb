class CreateAlbums < ActiveRecord::Migration
  def up
    create_table 'albums' do |t|
      t.string 'name'
      t.integer 'tracks'
      t.datetime 'release_date'
    end
  end

  def down
    drop_table 'albums'
  end
end

class CreateAlbums < ActiveRecord::Migration
  def up
    create_table 'albums' do |t|
      t.string 'name'
    end
  end

  def down
    drop_table 'albums'
  end
end

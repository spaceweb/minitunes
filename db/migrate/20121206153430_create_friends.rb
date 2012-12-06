class CreateFriends < ActiveRecord::Migration
  def change
    create_table 'friends' do |t|
      t.references :tunegoer
      t.references :tunegoer
    end
  end
end

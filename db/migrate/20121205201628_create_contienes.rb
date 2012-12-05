class CreateContienes < ActiveRecord::Migration
  def change
    create_table 'contienes' do |t|
      t.references :album
      t.references :song
    end
  end
end

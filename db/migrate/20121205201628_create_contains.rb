class CreateContains < ActiveRecord::Migration
  def change
    create_table 'contains' do |t|
      t.references :album
      t.references :song
    end
  end
end

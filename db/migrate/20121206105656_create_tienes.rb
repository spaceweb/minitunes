class CreateTienes < ActiveRecord::Migration
  def change
    create_table 'tienes' do |t|
      t.references :tunegoer
      t.references :artist
    end
  end
end

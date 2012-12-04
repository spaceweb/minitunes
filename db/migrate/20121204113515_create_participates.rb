class CreateParticipates < ActiveRecord::Migration
  def change
    create_table 'participates' do |t|
      t.string :name
      t.references :artist
      t.references :album
    end
  end
end

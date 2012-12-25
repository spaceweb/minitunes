class CreateAdds < ActiveRecord::Migration
  def change
    create_table 'adds' do |t|
      t.references :tunegoer
      t.references :artist
    end
  end
end

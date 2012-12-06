class CreateTunegoers < ActiveRecord::Migration
   def change
    create_table :tunegoers do |t|
      t.string :name
      t.string :provider
      t.string :uid
    end
  end
end

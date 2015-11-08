class CreateSupports < ActiveRecord::Migration
  def change
    create_table :supports do |t|
      t.references :campaign
      t.timestamps null: false
    end
  end
end

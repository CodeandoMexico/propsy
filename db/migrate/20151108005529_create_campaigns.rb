class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :description
      t.references :publisher
      t.string :sources, array: true

      t.timestamps null: false
    end
  end
end

class AddPetitionTypeToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :petition_type, :string
  end
end

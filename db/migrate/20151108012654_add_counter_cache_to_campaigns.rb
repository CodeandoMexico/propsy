class AddCounterCacheToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :supports_count, :integer, default: 0
    add_index  :campaigns, :supports_count
  end
end

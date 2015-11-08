class AddStateToSupport < ActiveRecord::Migration
  def change
    add_column :supports, :status, :string
  end
end

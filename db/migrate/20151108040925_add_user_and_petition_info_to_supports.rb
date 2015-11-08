class AddUserAndPetitionInfoToSupports < ActiveRecord::Migration
  def change
    change_table :supports do |t|
      t.string :name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.string :nationality
      t.string :education_level
      t.string :profession
      t.string :age
      t.string :petition_id 
    end
    add_index :supports, :petition_id
  end
end

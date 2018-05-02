class AddForeignToUserAndBattle < ActiveRecord::Migration[5.2]
  def change
  	add_column :battles, :user_id, :integer
    add_foreign_key :battles, :users, column: :user_id, primary_key: :id

    add_column :battles, :character_id, :integer
    add_foreign_key :battles, :characters, column: :character_id, primary_key: :id
  end
end

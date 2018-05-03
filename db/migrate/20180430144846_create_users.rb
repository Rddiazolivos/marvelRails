class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :name
      t.boolean :status, default: true
      t.integer :score, default: 0

      t.timestamps
    end
  end
end

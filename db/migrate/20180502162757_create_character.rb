class CreateCharacter < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
    	t.integer :code
      t.string  :name

      t.timestamps
    end
  end
end

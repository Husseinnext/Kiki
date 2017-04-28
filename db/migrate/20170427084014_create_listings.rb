class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :specifications
      t.integer :cost
      t.string :country
      t.references :user,  foreign_key: true, index: true
      t.timestamps
    end
  end
end

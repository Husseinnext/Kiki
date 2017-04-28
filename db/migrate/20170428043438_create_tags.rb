class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :smoker
      t.string :house
      t.string :apartment
      t.string :treehouse
      t.string :tent
      t.string :cave
      t.string :villa
      t.timestamps
    end
  end
end

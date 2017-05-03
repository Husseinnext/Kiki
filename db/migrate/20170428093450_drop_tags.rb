class DropTags < ActiveRecord::Migration[5.0]
  def change
    remove_column :tags, :smoker
    remove_column :tags, :house
    remove_column :tags, :apartment
    remove_column :tags, :treehouse
    remove_column :tags, :tent
    remove_column :tags, :cave
    remove_column :tags, :villa
    add_column :tags, :content, :string
  end
end

class AddAttributeToGarden < ActiveRecord::Migration
  def change
    add_column :gardens, :description, :string
  end
end

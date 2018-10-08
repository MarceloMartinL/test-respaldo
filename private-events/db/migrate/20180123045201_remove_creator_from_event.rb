class RemoveCreatorFromEvent < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :creator_id, :integer
  end
end

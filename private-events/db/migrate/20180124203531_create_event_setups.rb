class CreateEventSetups < ActiveRecord::Migration[5.1]
  def change
    create_table :event_setups do |t|

      t.timestamps
    end
  end
end

class AddColumnsToEventSetup < ActiveRecord::Migration[5.1]
  def change
    add_column :event_setups, :attendees_id, :integer
    add_column :event_setups, :attended_events_id, :integer
  end
end

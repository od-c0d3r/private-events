class AddIndexToTable < ActiveRecord::Migration[6.1]
  def change
    add_index :tokens, :attendee_id
    add_index :tokens, :event_id
  end
end

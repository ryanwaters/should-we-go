class CreateSkiconditions < ActiveRecord::Migration
  def change
    create_table :skiconditions do |t|

      t.timestamps
    end
  end
end

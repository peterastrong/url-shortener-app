class CreateVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :visits do |t|
      t.string :link_id
      t.string :ip_address

      t.timestamps
    end
  end
end

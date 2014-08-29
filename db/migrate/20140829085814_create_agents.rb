class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string "name"
      t.integer "default_contact"

      t.timestamps
    end
  end
end

class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.uuid :uuid, null:false, default:"gen_random_uuid()", index:true 
      t.string :code, limit:3, null:false
      t.string :name, limit: 120, null:false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end

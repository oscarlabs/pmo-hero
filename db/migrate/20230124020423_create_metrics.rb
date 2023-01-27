class CreateMetrics < ActiveRecord::Migration[7.0]
  def change
    create_table :metrics do |t|
      t.uuid :uuid, null:false, default:"gen_random_uuid()", index:true 
      t.string :name, null: false
      t.string :description, limit: 200, null:true, default: nil
      t.string :unit, limit: 5, null:true, default: nil

      t.timestamps
    end
  end
end

class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.uuid :uuid, null:false, default:"gen_random_uuid()", index:true 
      t.string :name, null:false, limit: 120
      t.string :code, null:false, limit: 3
      t.boolean :is_program, default: false
      t.references :project, null: true, foreign_key: true
      t.boolean :active, default:true
      
      t.timestamps
    end
  end
end

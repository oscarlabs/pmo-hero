class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.uuid :uuid, null:false, default: "gen_random_uuid()", index:true
      t.string :code, null:false, index: {unique:true, name: 'unique_rolecode'}
      t.string :name, null:false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end

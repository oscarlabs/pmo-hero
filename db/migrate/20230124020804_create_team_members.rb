class CreateTeamMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :team_members do |t|
      t.uuid :uuid, null:false, default:"gen_random_uuid()", index:true 
      t.references :team, null:false, foreign_key: true
      t.references :contributor, null:false, foreign_key: true
      t.references :role, null:false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateContributors < ActiveRecord::Migration[7.0]
  def change
    create_table :contributors do |t|
      t.uuid :uuid, null: false, default: "gen_random_uuid()", index: true 
      t.string :name, null: false, limit: 150
      t.string :title, null: false, limit: 150
      t.string :able_email, limit: 150
      t.string :caring_email, limit: 150
      t.boolean :active, default: true
      t.datetime :start_date, null: true, default: nil
      t.datetime :end_date, null: true, default: nil

      t.timestamps
    end
  end
end

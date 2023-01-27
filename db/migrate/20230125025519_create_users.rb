class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.uuid :uuid, null: false, default: "gen_random_uuid()", index: true
      t.string :name, null: false, limit: 200
      t.string :user_name, null: false, limit: 80
      t.string :email, null:false, index: { unique: true, name: 'unique_emails' }
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end

class CreateProjectMetrics < ActiveRecord::Migration[7.0]
  def change
    create_table :project_metrics do |t|
      t.references :project, null: false, foreign_key: true
      t.references :metric, null: false, foreign_key: true
      t.decimal :value, default:0

      t.timestamps
    end
  end
end

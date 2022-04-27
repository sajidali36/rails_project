class CreateBugsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :bugs_users do |t|
      t.references :bug, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

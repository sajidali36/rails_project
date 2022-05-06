# frozen_string_literal: true

class CreateBugs < ActiveRecord::Migration[6.0]
  def change
    create_table :bugs do |t|
      t.string :title, null: false, unique: true
      t.text :description
      t.string :type
      t.string :status
      t.date :deadline
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end

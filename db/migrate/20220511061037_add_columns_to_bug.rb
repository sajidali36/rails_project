# frozen_string_literal: true

class AddColumnsToBug < ActiveRecord::Migration[6.0]
  def change
    add_column :bugs, :bug_type, :integer
    add_column :bugs, :status, :integer
  end
end

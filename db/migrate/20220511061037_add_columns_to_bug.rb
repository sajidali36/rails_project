# frozen_string_literal: true

class AddColumnsToBug < ActiveRecord::Migration[6.0]
  def change
    add_column :bugs, :type_of, :integer
    add_column :bugs, :status_is, :integer
  end
end

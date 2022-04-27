# frozen_string_literal: true

class RemoveFieldFromBugs < ActiveRecord::Migration[6.0]
  def change
    remove_column :bugs, :type, :string
    remove_column :bugs, :status, :string
  end
end

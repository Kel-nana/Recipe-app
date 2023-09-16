# frozen_string_literal: true

# top-level documentation comment
class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :string
  end
end

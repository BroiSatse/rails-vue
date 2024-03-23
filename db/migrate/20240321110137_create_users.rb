# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :display_name
      t.string :email
      t.datetime :registered_on
      t.timestamps
    end
  end
end

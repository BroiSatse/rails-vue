# frozen_string_literal: true

class CreateEmailVerifications < ActiveRecord::Migration[7.1]
  def change
    create_table :email_verifications, id: :uuid do |t|
      t.references :owner, polymorphic: true, null: false, type: :string
      t.string :email, null: false
      t.string :target, null: false
      t.string :code_digest, null: false
      t.datetime :expires_at, null: false

      t.timestamps
    end
  end
end

# frozen_string_literal: true

class Auth::Models::Auth < ApplicationRecord
  self.table_name = 'auths'

  devise :database_authenticatable, :registerable

  belongs_to :user, class_name: 'Users::Models::User'
end

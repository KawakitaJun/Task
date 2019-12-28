class Client < ApplicationRecord
  belongs_to :user
  has_many :tasks, foreign_key: :client_id, dependent: :destroy
end

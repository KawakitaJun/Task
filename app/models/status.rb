class Status < ApplicationRecord
  has_many :tasks, foreign_key: :status_id
end

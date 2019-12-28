class Task < ApplicationRecord
  belongs_to :user
  belongs_to :client
  belongs_to :category
  belongs_to :status
end

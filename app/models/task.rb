class Task < ApplicationRecord
  belongs_to :user
  belongs_to :client, optional: true
  belongs_to :category, optional: true
  belongs_to :status, optional: true
end

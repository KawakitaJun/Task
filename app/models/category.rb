class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks,foreign_key: :category_id, dependent: :destroy
end

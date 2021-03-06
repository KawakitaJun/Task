class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :department
  has_many :categories, foreign_key: :user_id, dependent: :destroy
  has_many :clients, foreign_key: :user_id, dependent: :destroy
  has_many :tasks, foreign_key: :user_id, dependent: :destroy
end

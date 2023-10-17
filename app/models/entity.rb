class Entity < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true
  validates :group, presence: true

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :group
end

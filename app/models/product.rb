class Product < ApplicationRecord
  belongs_to :user
  default_scope -> {order(created_at: :DESC)}

  validates :user_id,      presence: true
  validates :name,         presence: true, length: {minimum: 1}
 # validates :description,  presence: true, length: {minimum: 1}
 # validates :project,      presence: true, length: {minimum: 1}
 # validates :price,        presence: true

end

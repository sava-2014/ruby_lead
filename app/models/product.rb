class Product < ApplicationRecord
  belongs_to :user
  has_many   :targets,  dependent: :destroy
  default_scope -> {order(created_at: :DESC)}

  validates :user_id,      presence: true
  validates :name,         presence: true, length: {minimum: 1}
 # validates :description,  presence: true, length: {minimum: 1}
 # validates :project,      presence: true, length: {minimum: 1}
 # validates :price,        presence: true


  def target_feed
    Target.where("product_id = ?", id)
  end
end

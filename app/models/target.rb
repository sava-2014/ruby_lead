class Target < ApplicationRecord
  belongs_to :product
  default_scope -> { order(created_at: :desc) }

  validates :product_id,           presence: true
  validates :target_name,          presence: true
  #validates :target_base,          presence: true
  #validates :target_traditional,   presence: true
  #validates :target_criteria,      presence: true
  #validates :target_minus,         presence: true
  #validates :target_decision,      presence: true
  #validates :target_advantages,    presence: true

end

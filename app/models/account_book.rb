class AccountBook < ActiveRecord::Base
  belongs_to :category
  validates :money, presence: true
  validates :category_id, presence: true
end

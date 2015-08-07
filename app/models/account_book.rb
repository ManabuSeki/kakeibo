class AccountBook < ActiveRecord::Base
  belongs_to :category
  belongs_to :out_category

  validates :money, presence: true
  validates :category_id, presence: true
end

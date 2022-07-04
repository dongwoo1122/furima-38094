class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :item_status_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true
  validates :delivery_fee_id, presence: true, numericality: { other_than: 1 }
  validates :address_region_id, presence: true, numericality: { other_than: 1 }
  validates :send_time_id, presence: true, numericality: { other_than: 1 }

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_fee
  belongs_to :address_region
  belongs_to :send_time

  with_options presence: true, format: { with:/\A[0-9]+\z/} do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end

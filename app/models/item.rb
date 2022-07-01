class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_status_id, presence: true
  validates :price, presence: true
  validates :delivery_fee_id, presence: true
  validates :address_region_id, presence: true
  validates :send_time_id, presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category


end

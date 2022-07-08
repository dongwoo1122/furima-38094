class OrderForm
  include ActiveModel::Model
    attr_accessor :user_id, :item_id, :address_region_id, :address_city, :address_street, :address_building, :postcode, :phone_number, :token

    with_options presence: true do
      validates :user_id
      validates :item_id
      validates :address_city, presence: true
      validates :address_street, presence: true
      validates :address_building, presence: false
      validates :postcode, presence: true, format: { with:/\A\d{3}[-]\d{4}\z/}
      validates :phone_number, presence: true, format: { with:/\A\d{10,11}\z/}
    end
      validates :address_region_id, presence: true, numericality: { other_than: 1}
      validates :token, presence: true
      
    def save
      order = Order.create(item_id: item_id, user_id: user_id)
      Delivery.create(address_city: address_city, address_region_id: address_region_id, address_street: address_street, address_building: address_building, postcode: postcode, phone_number: phone_number, order_id: order.id)
    end
end
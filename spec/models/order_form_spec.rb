require 'rails_helper'
RSpec.describe OrderForm, type: :model do
  describe '配送先情報の登録' do
      before do
        @user = FactoryBot.create(:user)
        @item = FactoryBot.create(:item)
        @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
      end

    context "配送先情報が登録できる場合" do
      it "全ての項目があれば出品内容は保存される" do
        expect(@order_form).to be_valid
      end
      it 'address_buildingは空でも保存できること' do
        @order_form.address_building = ''
        expect(@order_form).to be_valid
      end
    end

    context "出品内容が保存できない場合" do
      it "postcodeが空では登録できない" do
        @order_form.postcode = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postcode can't be blank")
      end     
      it "postcodeが「3桁ハイフン4桁」の半角文字列以外登録できない" do
        @order_form.postcode = '1111111'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postcode is invalid")
      end
      it "address_region_idが空では登録できない" do
        @order_form.address_region_id = '1'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address region must be other than 1")
      end
      it "address_cityが空では登録できない" do
        @order_form.address_city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address city can't be blank")
      end
      it "address_streetが空では登録できない" do
        @order_form.address_street = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address street can't be blank")
      end
      it "phone_numberが空では登録できない" do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが10桁以上11桁以内の半角数値以外登録できない" do
        @order_form.phone_number = '090-1234-5678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end      
    end
  end
end
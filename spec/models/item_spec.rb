require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品内容の保存' do
    context "出品内容が保存できる場合" do
      it "全ての項目があれば出品内容は保存される" do
        expect(@item).to be_valid
      end
    end
    context "出品内容が保存できない場合" do
      it "nameが空では登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end     
      it "descriptionが空では登録できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "category_idが空では登録できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "priceが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceに半角数値以外の文字が含まれていると登録できない" do
        @item.price = 'あa阿/'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "販売価格が300円より少ない時は登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "販売価格が9999999円より多い時は登録できない" do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "delivery_fee_idが空では登録できない" do
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it "address_region_idが空では登録できない" do
        @item.address_region_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Address region must be other than 1")
      end
      it "send_time_idが空では登録できない" do
        @item.send_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Send time must be other than 1")
      end
      it "ユーザー情報がない場合は登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end

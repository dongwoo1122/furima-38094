FactoryBot.define do
  factory :order_form do
    address_region_id       {"3"}
    address_city            {"Tokyocity"}
    address_street          {"meguro"}
    address_building        {"company"}
    postcode                {"111-1111"}
    phone_number            {"09000000000"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end

FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
   end
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    name01                {'山田'}
    name02                {'太郎'}
    kana01                {'ヤマダ'}
    kana02                {'タロウ'}
    birthday              {'1995/12/01'}
  end
end 
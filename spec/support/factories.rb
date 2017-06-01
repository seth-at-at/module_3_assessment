FactoryGirl.define do

  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    image_url "http://fakeimg.pl/300/"
    created_at "2017-04-02 17:35:14 UTC"
    updated_at "2017-05-02 17:35:14 UTC"
  end

  factory :user do
    name { Faker::Name.first_name }
    email { Faker::Internet.safe_email }
    created_at "2017-04-02 17:35:14 UTC"
    updated_at "2017-05-02 17:35:14 UTC"
  end

  factory :order do
    amount Faker::Number.number(5)
    user
    created_at "2017-04-02 17:35:14 UTC"
    updated_at "2017-05-02 17:35:14 UTC"
  end

  factory :order_item do
    item
    order
    created_at "2017-04-02 17:35:14 UTC"
    updated_at "2017-05-02 17:35:14 UTC"
  end

end

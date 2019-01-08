FactoryBot.define do
  factory :comment do
    weidoo_id { 1 }
    commenter { "MyString" }
    body { "MyText" }
  end
end

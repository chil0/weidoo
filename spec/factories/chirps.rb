FactoryBot.define do
  factory :chirp do
    user_id { 1 }
    chirp { "MyString" }
    photo { "" }
    file_name { "MyString" }
    file_type { "MyString" }
    chirped_at { "2018-12-26 20:00:47" }
  end
end

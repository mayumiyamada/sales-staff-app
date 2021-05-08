FactoryBot.define do
  factory :user do
    employee_id_number    { 01234 }
    name                  { '山田真由美' }
    name_kana             { 'マユミ' }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
  end
end
FactoryBot.define do
  factory :user do
    first_name { 'Aaron' }
    last_name { 'Summer' }
    email { 'tester@example.com' }
    password { 'dottle-nouveau-pavilion-tights-furze' }
  end
end

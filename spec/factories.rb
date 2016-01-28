FactoryGirl.define do
  factory :owner do
    login 'admin'
    password 'foobar'
    password_confirmation 'foobar'
  end
end

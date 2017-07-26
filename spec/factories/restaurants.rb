FactoryGirl.define do
  factory :restaurant do |f|
    user
    f.name 'Chez Toto'
    f.address '10 Cours Victor Hugo 33000 Bordeaux'
    f.primary_phone '0556575859'
    mood
    budget
  end
end

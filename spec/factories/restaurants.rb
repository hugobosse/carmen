FactoryGirl.define do
  factory :restaurant do |f|
    user
    f.name 'Chez Toto'
    f.address '10 Cours Victor Hugo 33000 Bordeaux'
    mood
    budget
  end
end

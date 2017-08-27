require 'faker'
require 'csv'

puts 'Cleaning db'
Tagging.destroy_all
Tag.destroy_all
Demand.destroy_all
Restaurant.destroy_all
User.destroy_all
Reservation.destroy_all
Ping.destroy_all
Budget.destroy_all
Status.destroy_all

# ------------------------------------------------------------------------------
puts 'Seeding statuses..'
%w(pending accepted refused cancelled noshow).each do |status|
  s = Status.new(name: status)
  puts s.errors.messages unless s.valid?
  s.save
end

# Seed restaurants, tags and budgets from original csv file
puts 'Seeding restaurants, budgets, tags'
filepath = '/home/pierre/Bureau/restos-db.csv'
csv_options = { headers: :first_row, col_sep: ';' }

CSV.foreach(filepath, csv_options) do |row|
  r = Restaurant.new(
    name: row['Nom'],
    address: row['Adresse'],
    primary_phone: PhonyRails.normalize_number(row['Téléphone'], country_code: 'FR')
  )
  # budget
  if Budget.find_by_name(row['Budget soir']).nil?
    b = Budget.new(name: row['Budget soir'])
    puts "budget error: #{b.errors.messages} for #{row['Nom']}" unless b.valid?
    b.save
    r.budget = b
  else
    r.budget = Budget.find_by_name(row['Budget soir'])
  end
  # tags and taggings
  if row['Tags'].nil?
    puts 'row tags empty !'
  else
    tags = row['Tags'].split('+')
    tags.each do |tag|
      if Tag.find_by_name(tag.strip).nil?
        t = Tag.new(name: tag.strip)
        puts "tag error: #{t.errors.messages}" unless t.valid?
        if t.save
          tg = Tagging.create!(tag: t, restaurant: r)
        end
      else
        tg = Tagging.create!(tag: Tag.find_by_name(tag.strip), restaurant: r)
      end
    end
  end
  puts "restaurant error: #{r.errors.messages}" unless r.valid?
  r.save
end

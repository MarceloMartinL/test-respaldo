# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a1 = Airport.create!(name: "NYC")
a2 = Airport.create!(name: "SFO")
a3 = Airport.create!(name: "LAN")
a4 = Airport.create!(name: "WSC")
a5 = Airport.create!(name: "DAL")
a6 = Airport.create!(name: "MIA")

airports = [a1, a2, a3, a4, a5, a6]

#Flight.create!(start_airport_id: 1, finish_airport_id: 2, date: 1.day.from_now, duration: "2 hours")
#Flight.create!(start_airport_id: 3, finish_airport_id: 4, date: 1.week.from_now, duration: "3 hours")
#Flight.create!(start_airport_id: 5, finish_airport_id: 1, date: 2.weeks.from_now, duration: "1 hour")

date1 = DateTime.new(2018,3,3)
date2 = DateTime.new(2018,3,23)
date3 = DateTime.new(2018,4,5)

dates = [date1, date2, date3]

airports.each do |a|
	airports.each do |b|
		if a.name != b.name
			dates.each do |d|
				3.times do |t|
					Flight.create!(start_airport_id: a.id, finish_airport_id: b.id, date: d+t.hours, duration: "#{t+1} hours")
				end
			end
		end
	end
end
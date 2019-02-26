5.times do |doctor|
  Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    specialty: Faker::TvShows::StarTrek.specie,
    age: rand(31..94)
  )
end

25.times do |patient|
  Patient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: rand(1..105),
    gender: ["XX", "XY"].sample
  )
end

doctor_ids = Doctor.all.collect { |x| x.id }
patient_ids = Patient.all.collect { |x| x.id }

100.times do |appointment|
  Appointment.create(
    dateTime: Faker::Time.forward(30),
    location: ["Office #1", "Office #2", "Office #3"].sample,
    doctor_id: doctor_ids.sample,
    patient_id: patient_ids.sample,
  )
end

puts "seeded."
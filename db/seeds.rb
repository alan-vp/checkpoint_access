# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "Creating companies, vehicles, entrances and exits"

5.times do
  company = Company.create(
    name: Faker::Company.name
  )
  3.times do
    company_vehicle = company.company_vehicles.create(
      brand: Faker::Vehicle.manufacture,
      model: Faker::Vehicle.model,
      license_plate:Faker::Vehicle.license_plate
    )
  end
end

private_company = Company.create(
  name: "Particular"
)
private_company_vehicle = private_company.company_vehicles.create(
  brand: "Particular",
  model: "Particular",
  license_plate: 0000
)

admin = User.create(
  email: "avp@gmail.com",
  password: 123456,
  first_name: "Alan",
  last_name: "Vergara",
  shift: "N/A",
  employee_number: 11223344,
  admin: true
)

company_vehicle = CompanyVehicle.all
company = Company.all

15.times do
  user = User.create(
    email: Faker::Internet.email(domain: 'accesspoint'),
    password: 123456,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    shift: %w[Matutino Vespertino],
    employee_number: Faker::Number.leading_zero_number(digits: 6),
    admin: false
  )

  entrances = Entrance.create(
    date: Faker::Date.between(from: '2022-12-01', to: '2022-12-08'),
    time: Time.now.strftime('%T'),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    destination: Faker::Company.industry,
    mileage: Faker::Vehicle.mileage(min: 1_000, max: 25_000).to_i,
    company_id: company.sample.id,
    company_vehicle_id: company_vehicle.sample.id,
    user_id: user.id
  )
end

15.times do
  user = User.create(
    email: Faker::Internet.email(domain: 'accesspoint'),
    password: 123456,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    shift: %w[Matutino Vespertino],
    employee_number: Faker::Number.leading_zero_number(digits: 6),
    admin: false
  )

  exits = Exit.create(
    date: Faker::Date.between(from: '2022-12-01', to: '2022-12-08'),
    time: Time.now.strftime('%T'),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    destination: Faker::Company.industry,
    mileage: Faker::Vehicle.mileage(min: 1_000, max: 25_000).to_i,
    invoice: Faker::Invoice.reference,
    company_id: company.sample.id,
    company_vehicle_id: company_vehicle.sample.id,
    user_id: user.id
  )
end

puts "Done!"

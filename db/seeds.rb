
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Machine.destroy_all
Gym.destroy_all

gym = Gym.create!(name: "24 Hour Fitness", city: "Los Angeles", capacity: 222, is_open: true)
gym_2 = Gym.create!(name: "Equinox", city: "San Francisco", capacity: 250, is_open: true)
gym_3 = Gym.create!(name: "Planet Fitness", city: "Antioch", capacity: 170, is_open: false)

machine = gym.machines.create!(name: "Leg Press", section: "Resistance Machines", recommended_sets: 5, recommended_reps: 10, is_broken: false)
machine_2 = gym.machines.create!(name: "Elliptical", section: "Cardio", recommended_sets: 1, recommended_reps: 1, is_broken: false)
machine_3 = gym.machines.create!(name: "Smith Machine", section: "Personal Training", recommended_sets: 5, recommended_reps: 12, is_broken: true)
machine_4 = gym_2.machines.create!(name: "Preacher Curl", section: "Resistance Machines", recommended_sets: 4, recommended_reps: 15, is_broken: true)
machine_5 = gym_2.machines.create!(name: "Stair Climber", section: "Cardio", recommended_sets: 1, recommended_reps: 1000, is_broken: false)
machine_6 = gym_3.machines.create!(name: "Hamstring Curl", section: "Resistance Machines", recommended_sets: 4, recommended_reps: 12, is_broken: false)

Car.destroy_all
Dealership.destroy_all

honda = Dealership.create!(name: 'Honda', city: 'Thornton', employees: 46, offer_financing: true)
nissan = Dealership.create!(name: 'Nissan', city: 'Riverside', employees: 77, offer_financing: false)
toyota = Dealership.create!(name: 'Toyota', city: 'Denver', employees: 38, offer_financing: false)
bmw = Dealership.create!(name: 'BMW', city: 'Los Angeles', employees: 27, offer_financing: true)
tesla = Dealership.create!(name: 'Tesla', city: 'Santa Monica', employees: 96, offer_financing: true)

civic = honda.cars.create!(name: "Civic", body_style: "Coupe", mpg: 55, electrical: true)
accord = honda.cars.create!(name: "Accord", body_style: "Coupe", mpg: 42, electrical: false)

gtr = nissan.cars.create!(name: "GTR", body_style: "Coupe", mpg: 26, electrical: false)
altima = nissan.cars.create!(name: "Altima", body_style: "Sedan", mpg: 30, electrical: false)

supra = toyota.cars.create!(name: "Supra", body_style: "Coupe", mpg: 28, electrical: false)
tundra = toyota.cars.create!(name: "Tundra", body_style: "Truck", mpg: 19, electrical: false)

mfive = bmw.cars.create!(name: "M5", body_style: "Sedan", mpg: 29, electrical: false)
meight = bmw.cars.create!(name: "M8 Competition", body_style: "Convertable", mpg: 15, electrical: false)

model_s = tesla.cars.create!(name: "Model S", body_style: "Sedan", mpg: 124, electrical: true)
model_x = tesla.cars.create!(name: "Model X", body_style: "Sedan", mpg: 107, electrical: true)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
gym = Gym.create!(name: "24 Hour Fitness", city: "Los Angeles", capacity: 222, is_open: true)
gym_2 = Gym.create!(name: "Equinox", city: "San Francisco", capacity: 250, is_open: true)
gym_3 = Gym.create!(name: "Planet Fitness", city: "Antioch", capacity: 170, is_open: false)

machine = gym.machines.create!(name: "Leg Press", section: "Resistance Machines", recommended_sets: 5, recommended_reps: 10, is_broken: false)
machine_2 = gym.machines.create!(name: "Elliptical", section: "Cardio", recommended_sets: 1, recommended_reps: 1, is_broken: false)
machine_3 = gym.machines.create!(name: "Smith Machine", section: "Personal Training", recommended_sets: 5, recommended_reps: 12, is_broken: true)
machine_4 = gym_2.machines.create!(name: "Preacher Curl", section: "Resistance Machines", recommended_sets: 4, recommended_reps: 15, is_broken: true)
machine_5 = gym_2.machines.create!(name: "Stair Climber", section: "Cardio", recommended_sets: 1, recommended_reps: 1000, is_broken: false)
machine_6 = gym_3.machines.create!(name: "Hamstring Curl", section: "Resistance Machines", recommended_sets: 4, recommended_reps: 12, is_broken: false)

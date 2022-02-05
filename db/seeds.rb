Car.destroy_all
Dealership.destroy_all

honda = Dealership.create!(name: 'Honda', city: 'Thornton', employees: 46, offer_financing: true)
nissan = Dealership.create!(name: 'Nissan', city: 'Riverside', employees: 77, offer_financing: false)
toyota = Dealership.create!(name: 'Toyota', city: 'Denver', employees: 38, offer_financing: false)
bmw = Dealership.create!(name: 'BMW', city: 'Los Angeles', employees: 27, offer_financing: true)
tesla = Dealership.create!(name: 'Tesla', city: 'Santa Monica', employees: 96, offer_financing: true)

honda.cars.create!(name: "Civic", body_style: "Coupe", mpg: 55, electrical: true)
honda.cars.create!(name: "Accord", body_style: "Coupe", mpg: 42, electrical: false)

nissan.cars.create!(name: "GTR", body_style: "Coupe", mpg: 26, electrical: false)
nissan.cars.create!(name: "Altima", body_style: "Sedan", mpg: 30, electrical: false)

toyota.cars.create!(name: "Supra", body_style: "Coupe", mpg: 28, electrical: false)
toyota.cars.create!(name: "Tundra", body_style: "Truck", mpg: 19, electrical: false)

bmw.cars.create!(name: "M5", body_style: "Sedan", mpg: 29, electrical: false)
bmw.cars.create!(name: "M8 Competition", body_style: "Convertable", mpg: 15, electrical: false)

tesla.cars.create!(name: "Model S", body_style: "Sedan", mpg: 124, electrical: true)
tesla.cars.create!(name: "Model X", body_style: "Sedan", mpg: 107, electrical: true)

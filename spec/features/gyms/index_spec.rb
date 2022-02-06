require 'rails_helper'

RSpec.describe 'gym index page' do
  before(:each) do
    @gym_1 = Gym.create!(name: "24 Hour Fitness", city: "Los Angeles", capacity: 222, is_open: true)
    @gym_2 = Gym.create!(name: "Planet Pump", city: "Marin", capacity: 160, is_open: false)
    @gym_3 = Gym.create!(name: "Equinox", city: "San Francisco", capacity: 200, is_open: false)
  end

  it 'displays all gyms in the gym index' do
    visit "/gyms/"

    expect(page).to have_content(@gym_1.name)
    expect(page).to have_content(@gym_2.name)
    expect(page).to have_content(@gym_3.name)
  end

  it 'orders gym by those most recently created first' do
    visit "/gyms"

    expect(@gym_2.name).to appear_before(@gym_1.name)
    expect(@gym_3.name).to appear_before(@gym_2.name)
    expect(@gym_2.name).to_not appear_before(@gym_3.name)
    expect(@gym_1.name).to_not appear_before(@gym_2.name)
  end

  it 'can see a count of machines associated with each gym' do
    machine = @gym_1.machines.create!(name: "Leg Press", section: "Resistance Machines", recommended_sets: 5, recommended_reps: 10, is_broken: false)
    machine_2 = @gym_1.machines.create!(name: "Elliptical", section: "Cardio", recommended_sets: 1, recommended_reps: 1, is_broken: false)
    machine_3 = @gym_1.machines.create!(name: "Smith Machine", section: "Personal Training", recommended_sets: 5, recommended_reps: 12, is_broken: true)

    visit "/gyms"

    expect(page).to have_content("Machine Count: #{@gym_1.machines.count}")
    expect(page).to have_content("Machine Count: #{@gym_2.machines.count}")
    expect(page).to have_content("Machine Count: #{@gym_3.machines.count}")
  end

  it 'displays a link on the top of each page to the gyms index' do
    visit "/machines"
    expect(page).to have_link("Gym Index", :href =>"/gyms")

    visit "/"
    expect(page).to have_link("Gym Index", :href =>"/gyms")

    visit "/gyms/#{@gym_1.id}"
    expect(page).to have_link("Gym Index", :href =>"/gyms")
  end

  # save_and_open_page

end

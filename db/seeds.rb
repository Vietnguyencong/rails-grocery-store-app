# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
statuses  = ['new hire', 'freshman', 'junior', 'senior']
departments = ['sales', 'marketing', 'hopspi', 'accounting', 'technology']
roles = ['intern', 'assistant', 'employee', 'contract', 'manager', 'vice']
reviewss = ['awsome', 'very good', 'good', 'alright', 'whatever','bad', 'very bad' ]
points = [5,4,3,2]
# store has many departments, department has many employees, store has many reviews 
10.times do 
    Store.create(name: Faker::Company.name, description: Faker::Company.industry, url: Faker::Internet.url, status: Faker::Company.buzzword, code: Faker::Currency.code, address: Faker::Address.community,
    city: Faker::Address.city, state: Faker::Address.state, zip: Faker::Address.zip, country: Faker::Address.country)
end

Store.all.each do |s|
    # creating the departments
    4.times do 
        Department.create(store_id: s.id, name: departments[rand(0..4)], description: "this is the description", code: departments[rand(0..4)])
    end

end


Department.all.each do |d|
    #make the employee 
    rand(3..7).times do
        Employee.create(first_name: Faker::Name.female_first_name, last_name: Faker::Name.female_first_name, 
            description: "this is the employee desc", role: roles[rand(0..5)], status: statuses[rand(0..3)], department_id: d.id)
    end
end

Department.all.each do |d|
    #make the employee 
    st_id = d.store.id
    d.employees.all.each do |e|
        Review.create(store_id: st_id, note: reviewss[rand(0..5)], employee_id: e.id)
    end
end

    # # creating the review
    # 10.times do
    #     Review.create(store_id: s.id, note: reviewss[rand(0..5)])
    # end
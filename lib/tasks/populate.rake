namespace :db do
  desc "Clear the db and fill with sample data."
  task :populate => :environment do
      require 'populator'
      require 'faker'

    #clears the db of old data
    [Dog, Owner, Vet].each(&:destroy_all)

    #Adds excellent data to db
    Breed.find_each do |breed|
      Owner.populate 2 do |owner|
      owner.first_name = Faker::Name.first_name
      owner.last_name = Faker::Name.last_name
      owner.phone = Faker::PhoneNumber.phone_number
      owner.emergency_name = Faker::Name.name
      owner.emergency_phone = Faker::PhoneNumber.phone_number
        Vet.populate 1 do |vet|
        vet.doctor = Faker::Name.name + " " + "DVM"
        vet.clinic = Faker::Company.name + " " + "Vet"
        vet.phone = Faker::PhoneNumber.phone_number
          Dog.populate 2 do |dog|
          dog.name = Faker::Name.first_name
          dog.dob = Faker::Date.between(4000.days.ago, Date.today)
          dog.checked_in = Faker::Boolean.boolean
          dog.breed_id = breed.id
          dog.owner_id = owner.id
          dog.vet_id = vet.id
          end
        end
      end
    end
  puts "You have populated a database! Hooray!"
  end
end
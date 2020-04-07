# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Add initial role in database.


# Capistrano-rails-collection cammands
#cap production rails:rake:log:clear
#cap production rails:rake:tmp:clear
#cap production rails:rake:db:drop
#cap production rails:rake:db:reset
#cap production rails:rake:db:setup
#cap production rails:rake:db:seed
#cap production rails:rake:db:migrate
#cap production rails:rake:db:rollback


# Roles

unless Role.all.present?
    roles = Role.create(
        [
            {name: "superuser"},
            {name: "root"},
            {name: "guest"},
            {name: "user"},
            {name: "demo"}

            

        ])
else
    roles = Role.all

end



# Users
unless User.all.present?
    users = User.create([
        {login: "superuser",  email: "superuser@gmail.com",  password: "AMOSXZIBITDE88", password_confirmation: "AMOSXZIBITDE88", role_id:  Role.find_by(name: "superuser").id},
        {login: "root",  email: "root@gmail.com",  password: "AMOSXZIBITDE88", password_confirmation: "AMOSXZIBITDE88", role_id: Role.find_by(name: "root").id},
        {login: "user",  email: "user@gmail.com",  password: "AMOSXZIBITDE88", password_confirmation: "AMOSXZIBITDE88", role_id:  Role.find_by(name: "user").id},
        {login: "guest",  email: "guest@gmail.com",  password: "AMOSXZIBITDE88", password_confirmation: "AMOSXZIBITDE88", role_id:  Role.find_by(name: "guest").id},
        {login: "demo",  email: "demo@gmail.com",  password: "demo2019", password_confirmation: "demo2019", role_id: Role.find_by(name: "superuser").id}


    
    ])
else   
    users = User.all
end

unless Service.all.present?
    services = Service.create(
        [
            {name: "Informatique" },
            {name: "Direction"},
            {name: "Comptabilité"}

        ])
else
    services = Service.all
end

unless Profile.all.present?
    profile = Profile.create([
        {
            first_name: "Amos",  
            last_name: "DEMBELE",
            service_id: services.first.id,   
            user_id: users.first.id
        },
        {
            first_name: "Alassane",  
            last_name: "BABY",
            service_id: services.first.id, 
            user_id: users.last.id
        }
    
    ])

end

unless CustomerType.all.present?
    customer_types = CustomerType.create(
        [
            {name: "RS Fractioné", user_id: users.first.id },
            {name: "RS", user_id: users.first.id},
            {name: "RNS", user_id: users.first.id}
            


        ])
else
    customer_types = CustomerType.all
end


unless HeadPontType.all.present?
    head_pont_types = HeadPontType.create(
        [
            {name: "RS", user_id: users.first.id },
            {name: "RNS", user_id: users.first.id},
           

        ])
else
    head_pont_types = HeadPontType.all
end


unless SubHeadPontType.all.present?
    sub_head_pont_types = SubHeadPontType.create(
        [
            {name: "RS" , user_id: users.first.id},
            {name: "RNS", user_id: users.first.id},
            

        ])
else
    sub_head_pont_types = SubHeadPontType.all
end

unless PaymentType.all.present?
    payment_types = PaymentType.create(
        [
            {name: "Envoi UV" },
            {name: "Verssement boutique"},
            

        ])
else
    payment_types = PaymentType.all
end


unless City.all.present?
    city = City.create(
        [
            {name: "BAMAKO"},
            {name: "KAYES" },
            {name: "KOULIKORO"},
            {name: "SIKASSO"},
            {name: "SEGOU"},
            {name: "MOPTI"},
            {name: "GAO"},
            {name: "TOMBOUCTOU"},
            {name: "KIDAL"},
            {name: "MENAKA"},
            

        ])
else
    cities = City.all
end

unless Locality.all.present?
    localities = Locality.create(
        [
            {city_id: City.find_by(name: "BAMAKO").id},
            {name: "BAMAKO"},
            

        ])
else
    localities = Locality.all
end


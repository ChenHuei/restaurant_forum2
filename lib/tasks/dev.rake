namespace :dev do

  task fake: :environment do

    Restaurant.destroy_all

    500.times do |i|
      Restaurant.create!(name: FFaker::Animal.common_name,
        image: File.open(File.join(Rails.root, "/seed_img/#{rand(0...8)}.jpg")),
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample

      )
    end
    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
  end
end
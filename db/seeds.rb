# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

libraries = [["The John Crerar Library", "1100 E. 57th St.Chicago, IL 60637",
              "https://www.lib.uchicago.edu/media/original_images/crerar.jpg",
              "A library with advanced infrastructure for Computer Science department", 200],
             ["The Joseph Regenstein Library", "1100 E. 57th St.Chicago, IL 60637",
              "https://www.lib.uchicago.edu/media/original_images/reg.jpg",
              "The main library of Uchicago", 500],
             ["The Joe and Rika Mansueto Library", "1100 E. 57th St.Chicago, IL 60637",
               "https://www.lib.uchicago.edu/media/original_images/mansueto.jpg",
              "An amazing library with modern glazing wraps", 100]
            ]

Library.delete_all

libraries.each do |lib|
  library = Library.new
  library.name = lib[0]
  library.address = lib[1]
  library.photo_url = lib[2]
  library.description = lib[3]
  library.room_number = lib[4]
  library.save
end

users = [["yukun", "yukun", "Yukun", "Du", "yukundu@uchicago.edu", true],
         ["jiji", "jiji", "ZH", "Chen", "zhihuangc@uchicago.edu", false],
         ["y", "y", "Yang", "Chen", "yc@uchicago.edu", false]]

 User.delete_all
 users.each do |item|
   user = User.new
   user.username = item[0]
   user.password = item[1]
   user.first_name = item[2]
   user.last_name = item[3]
   user.email = item[4]
   user.is_admin = item[5]
   user.save
 end

# for reservation part
reservations = [
   ["11:00", "12:00", false],
   ["12:00", "15:00", false],
   ["16:00", "20:00", false],
   ["21:00", "22:00", false],
   ["14:00", "15:00", false]
 ]

Reservation.delete_all

reservations.each do |entry|
  reservation = Reservation.new
  sample_user = User.sample
  loop do
    sample_user = User.sample
    break unless sample_user.is_admin == true
  end
  reservation.user_id = sample_user.id
  reservation.library_id = Library.sample.id
  indexes = [1,2,3]
  reservation.date = (Date.today + indexes.sample).to_s
  reservation.start_time = entry[0]
  reservation.end_time = entry[1]
  reservation.canceled = entry[2]
  reservation.save
end

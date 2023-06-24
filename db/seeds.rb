# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = [
  { name: 'John Doe', email: 'john@example.com', password: 'password' },
  { name: 'Jane Smith', email: 'jane@example.com', password: 'password' },
  { name: 'Mike Johnson', email: 'mike@example.com', password: 'password' },
  { name: 'Sarah Thompson', email: 'sarah@example.com', password: 'password' },
  { name: 'Robert Davis', email: 'robert@example.com', password: 'password' },
  { name: 'Emily Wilson', email: 'emily@example.com', password: 'password' },
  { name: 'Michael Brown', email: 'michael@example.com', password: 'password' },
  { name: 'Jennifer Anderson', email: 'jennifer@example.com', password: 'password' },
  { name: 'David Martinez', email: 'david@example.com', password: 'password' },
  { name: 'Jessica Lee', email: 'jessica@example.com', password: 'password' },
  { name: 'Daniel Thompson', email: 'daniel@example.com', password: 'password' },
  { name: 'Amanda Wright', email: 'amanda@example.com', password: 'password' },
  { name: 'Christopher Taylor', email: 'christopher@example.com', password: 'password' },
  { name: 'Laura Hernandez', email: 'laura@example.com', password: 'password' },
  { name: 'Matthew Wilson', email: 'matthew@example.com', password: 'password' },
  { name: 'Lauren White', email: 'lauren@example.com', password: 'password' },
  { name: 'James Miller', email: 'james@example.com', password: 'password' },
  { name: 'Megan Davis', email: 'megan@example.com', password: 'password' },
  { name: 'Ryan Thompson', email: 'ryan@example.com', password: 'password' },
  { name: 'Stephanie Clark', email: 'stephanie@example.com', password: 'password' }
]

cameras = [
  { brand: 'Canon', model: 'EOS Rebel T6', year: 2016, price: 500, condition: 'New' },
  { brand: 'Nikon', model: 'D3500', year: 2018, price: 450, condition: 'Used' },
  { brand: 'Sony', model: 'Alpha A6000', year: 2014, price: 600, condition: 'New' },
  { brand: 'Fujifilm', model: 'X-T20', year: 2017, price: 800, condition: 'Used' },
  { brand: 'Olympus', model: 'OM-D E-M10 Mark II', year: 2015, price: 400, condition: 'Used' },
  { brand: 'Panasonic', model: 'Lumix GH5', year: 2017, price: 1500, condition: 'New' },
  { brand: 'Leica', model: 'Q2', year: 2019, price: 5000, condition: 'New' },
  { brand: 'Pentax', model: 'K-70', year: 2016, price: 700, condition: 'Used' },
  { brand: 'Samsung', model: 'NX500', year: 2015, price: 300, condition: 'Used' },
  { brand: 'Hasselblad', model: 'X1D II 50C', year: 2019, price: 10000, condition: 'New' }
]

bookings = [
  { start_date: Date.today, end_date: Date.today + 7 },
  { start_date: Date.today + 10, end_date: Date.today + 15 },
  { start_date: Date.today + 20, end_date: Date.today + 25 },
  { start_date: Date.today + 5, end_date: Date.today + 12 },
  { start_date: Date.today + 14, end_date: Date.today + 21 },
  { start_date: Date.today + 30, end_date: Date.today + 37 },
  { start_date: Date.today + 8, end_date: Date.today + 14 },
  { start_date: Date.today + 22, end_date: Date.today + 29 },
  { start_date: Date.today + 3, end_date: Date.today + 10 },
  { start_date: Date.today + 18, end_date: Date.today + 25 },
  { start_date: Date.today + 35, end_date: Date.today + 42 },
  { start_date: Date.today + 16, end_date: Date.today + 23 },
  { start_date: Date.today + 28, end_date: Date.today + 35 },
  # Add more booking data as needed
]

reviews = [
  { rating: 4, comment: 'Great camera for beginners!' },
  { rating: 5, comment: 'Excellent image quality and features.' },
  { rating: 3, comment: 'Decent camera, but could be better.' },
  { rating: 4, comment: 'Impressive performance and durability.' },
  { rating: 5, comment: 'Highly recommended for professional use.' },
  { rating: 2, comment: 'Disappointing image quality.' },
]

# users.each do |user_attributes|
#   User.create(user_attributes)
# end

# # Fetch all existing users
# users = User.all

# # Iterate over the users and create cameras
# users.each do |user|
#   # Randomly select a camera for the user
#   camera = cameras.sample

#   # Create a camera for the user
#   user.cameras.create(camera)
# end

users = User.all
cameras = Camera.all

users.each do |user|
  cameras.each do |camera|
    booking = bookings.sample
    user.bookings.create(camera: camera, start_date: booking[:start_date], end_date: booking[:end_date])
  end
end

cameras.each do |camera|
  # Shuffle the reviews array to get random reviews for each camera
  random_reviews = reviews.shuffle

  # Take the first three reviews from the shuffled array
  selected_reviews = random_reviews.take(3)

  # Create the selected reviews for the camera
  selected_reviews.each do |review_attributes|
    # Randomly select a user for the review
    user = User.all.sample

    # Create the review for the camera with the associated user
    camera.reviews.create(review_attributes.merge(user: user))
  end
end

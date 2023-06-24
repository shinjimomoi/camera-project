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

users.each do |user_attributes|
  User.create(user_attributes)
end

# Fetch all existing users
users = User.all

# Iterate over the users and create cameras
users.each do |user|
  # Randomly select a camera for the user
  camera = cameras.sample

  # Create a camera for the user
  user.cameras.create(camera)
end

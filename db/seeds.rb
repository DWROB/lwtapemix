# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "cleaning the db"
Playlist.destroy_all

puts "making two users"

User.create!(email: "dal@verydal.com", name: "daaaal", password: "111111")
User.create!(email: "1@1.com", name: "user 2", password: "123456")

puts "making the playlist first for user_id: 1"

playlist_seed = Playlist.new(
  name: "My Playlist #2",
  spotify_playlist_id: "1PA2xhSfvVa6oBz8WOe6tf",
  user_id: 1,
  playlist_images: "https://mosaic.scdn.co/300/ab67616d0000b27390497cd6cc6338bbe57fc953ab67616d0000b273d7de90b4628456f13fe629d2ab67616d0000b273d85c957794c2a5b8b11de5f9ab67616d0000b273edf91cd0c0b08afbcf20f6d1",
  owner: "dal"
)

playlist_seed.save

puts "playlist made.  creating songs..."

Song.create!(
  playlist_id: playlist_seed.id,
  name: "On the Luna",
  image: "https://i.scdn.co/image/ab67616d0000b27338fe495ad75bd55c146125b6",
  spotify_id: "0Sfj5fPqZzCq9o3f1NNphz",
  artist: "Foals"
)

Song.create!(
  playlist_id: playlist_seed.id,
  name: "Peaches",
  image: "https://i.scdn.co/image/ab67616d0000b273d6d43a45746154bf87fd682b",
  spotify_id: "0JsRZWdSquAQtgyJO8mhLA",
  artist: "In The Valley Below"

)


Song.create!(
  playlist_id: playlist_seed.id,
  name: "Balance",
  image: "https://i.scdn.co/image/ab67616d0000b273f666b5a59205ac2ee08959e7",
  spotify_id: "5waH4K1bmTMlikre01uqKi",
  artist: "Future Islands"

)

Song.create!(
  playlist_id: playlist_seed.id,
  name: "London Dungeon",
  image: "https://i.scdn.co/image/ab67616d0000b273d5446acf2c34078e85f58de2",
  spotify_id: "3hplBjBmQqR49L8THyjTdb",
  artist: "Misfits"
)

Song.create!(
  playlist_id: playlist_seed.id,
  name: "Time to Pretend",
  image: "https://i.scdn.co/image/ab67616d0000b2738b32b139981e79f2ebe005eb",
  spotify_id: "4iG2gAwKXsOcijVaVXzRPW",
  artist: "MGMT"
)

Song.create!(
  playlist_id: playlist_seed.id,
  name: "Half Mast",
  image: "https://i.scdn.co/image/ab67616d0000b2731764a4e742fe4c69e4d16316",
  spotify_id: "2o8pFe93xgZaQ4Hw7mSX9t",
  artist: "Empire of the Sun"

)

Song.create!(
  playlist_id: playlist_seed.id,
  name: "What Went Down",
  image: "https://i.scdn.co/image/ab67616d0000b273b036f68e97ce9f5372bfb350",
  spotify_id: "78tgXRq9Q6tPNP9hKCpgwB",
  artist: "Foals"

)

Song.create!(
  playlist_id: playlist_seed.id,
  name: "Patty Cake",
  image: "https://i.scdn.co/image/ab67616d0000b2731541a676423805fc68ff3e66",
  spotify_id: "0bXFIF7iL17TYLyx8JHziM",
  artist: "Kodak Black"
)

Song.create!(
  playlist_id: playlist_seed.id,
  name: "Wake Me Up",
  image: "https://i.scdn.co/image/ab67616d0000b27345a99e9953b74689ae4ff83d",
  spotify_id: "4UjH4A9OlMOlFKP9gKtazR",
  artist: "Foals"
)

Song.create!(
  playlist_id: playlist_seed.id,
  name: "OK",
  image: "https://i.scdn.co/image/ab67616d0000b27318613efad01d21a4a67cc532",
  spotify_id: "0APAKxMXB7jdDs4kw1l30y",
  artist: "Wallows"
)

Song.create!(
  playlist_id: playlist_seed.id,
  name: "The Sound of Settling",
  image: "https://i.scdn.co/image/ab67616d0000b273c306113cf2eea54867337da2",
  spotify_id: "0PTYTZvNNtlvdOwWRYrbfC",
  artist: "Death Cab for Cutie"
)

Song.create!(
  playlist_id: playlist_seed.id,
  name: "Helena Beat",
  image: "https://i.scdn.co/image/ab67616d0000b273121d5f92cf90576907dfb1e5",
  spotify_id: "4VbDJMkAX3dWNBdn3KH6Wx",
  artist: "Foster The People"
)

Song.create!(
  playlist_id: playlist_seed.id,
  name: "Jackie Chan",
  image: "https://i.scdn.co/image/ab67616d0000b2739759d6dfa2c19091814fccb3",
  spotify_id: "4vvnuJlgBeNVwq3TNmLMNX",
  artist: "Tiësto"

)

Song.create!(
  playlist_id: playlist_seed.id,
  name: "Dashboard",
  image: "https://i.scdn.co/image/ab67616d0000b273ed8a70a92499e619895646e8",
  spotify_id: "0Fe3WxeO6lZZxj7ytvbDUh",
  artist: "Modest Mouse"
)

puts "making the playlist first for user_id: 2"

playlist_seed = Playlist.new(
  name: "Hip Hop",
  spotify_playlist_id: "5pqb7KOl2vblRTdNoByPYH",
  user_id: 2,
  playlist_images: "https://mosaic.scdn.co/640/ab67616d0000b2730b3331c0bfce749049377d70ab67616d0000b27352f194d02c39909d1b284799ab67616d0000b2736ce90ec627a0198a8efd127fab67616d0000b273d552416cafb8792b442655b2",
  owner: "Ryan"
)

playlist_seed.save

puts "playlist made.  creating songs..."



Song.create!(
  playlist_id: playlist_seed.id,
  name: "On the Luna",
  image: "https://i.scdn.co/image/ab67616d0000b27338fe495ad75bd55c146125b6",
  spotify_id: "0Sfj5fPqZzCq9o3f1NNphz",
  artist: "Foals"
)

Song.create!(
  playlist_id: playlist_seed.id,
  name: "Peaches",
  image: "https://i.scdn.co/image/ab67616d0000b273d6d43a45746154bf87fd682b",
  spotify_id: "0JsRZWdSquAQtgyJO8mhLA",
  artist: "In The Valley Below"

)


Song.create!(
  playlist_id: playlist_seed.id,
  name: "Balance",
  image: "https://i.scdn.co/image/ab67616d0000b273f666b5a59205ac2ee08959e7",
  spotify_id: "5waH4K1bmTMlikre01uqKi",
  artist: "Future Islands"

)

Song.create!(
  playlist_id: playlist_seed.id,
  name: "London Dungeon",
  image: "https://i.scdn.co/image/ab67616d0000b273d5446acf2c34078e85f58de2",
  spotify_id: "3hplBjBmQqR49L8THyjTdb",
  artist: "Misfits"
)

Song.create!(
  playlist_id: playlist_seed.id,
  name: "Time to Pretend",
  image: "https://i.scdn.co/image/ab67616d0000b2738b32b139981e79f2ebe005eb",
  spotify_id: "4iG2gAwKXsOcijVaVXzRPW",
  artist: "MGMT"
)

Song.create!(
  playlist_id: playlist_seed.id,
  name: "Half Mast",
  image: "https://i.scdn.co/image/ab67616d0000b2731764a4e742fe4c69e4d16316",
  spotify_id: "2o8pFe93xgZaQ4Hw7mSX9t",
  artist: "Empire of the Sun"

)

Song.create!(
  playlist_id: playlist_seed.id,
  name: "What Went Down",
  image: "https://i.scdn.co/image/ab67616d0000b273b036f68e97ce9f5372bfb350",
  spotify_id: "78tgXRq9Q6tPNP9hKCpgwB",
  artist: "Foals"

)

Song.create!(
  playlist_id: playlist_seed.id,
  name: "Patty Cake",
  image: "https://i.scdn.co/image/ab67616d0000b2731541a676423805fc68ff3e66",
  spotify_id: "0bXFIF7iL17TYLyx8JHziM",
  artist: "Kodak Black"
)

Song.create!(
  playlist_id: playlist_seed.id,
  name: "Wake Me Up",
  image: "https://i.scdn.co/image/ab67616d0000b27345a99e9953b74689ae4ff83d",
  spotify_id: "4UjH4A9OlMOlFKP9gKtazR",
  artist: "Foals"
)

Song.create!(
  playlist_id: playlist_seed.id,
  name: "OK",
  image: "https://i.scdn.co/image/ab67616d0000b27318613efad01d21a4a67cc532",
  spotify_id: "0APAKxMXB7jdDs4kw1l30y",
  artist: "Wallows"
)

Song.create!(
  playlist_id: playlist_seed.id,
  name: "The Sound of Settling",
  image: "https://i.scdn.co/image/ab67616d0000b273c306113cf2eea54867337da2",
  spotify_id: "0PTYTZvNNtlvdOwWRYrbfC",
  artist: "Death Cab for Cutie"
)

Song.create!(
  playlist_id: playlist_seed.id,
  name: "Helena Beat",
  image: "https://i.scdn.co/image/ab67616d0000b273121d5f92cf90576907dfb1e5",
  spotify_id: "4VbDJMkAX3dWNBdn3KH6Wx",
  artist: "Foster The People"
)

Song.create!(
  playlist_id: playlist_seed.id,
  name: "Jackie Chan",
  image: "https://i.scdn.co/image/ab67616d0000b2739759d6dfa2c19091814fccb3",
  spotify_id: "4vvnuJlgBeNVwq3TNmLMNX",
  artist: "Tiësto"

)

Song.create!(
  playlist_id: playlist_seed.id,
  name: "Dashboard",
  image: "https://i.scdn.co/image/ab67616d0000b273ed8a70a92499e619895646e8",
  spotify_id: "0Fe3WxeO6lZZxj7ytvbDUh",
  artist: "Modest Mouse"
)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Band.destroy_all
Track.destroy_all
Album.destroy_all

band1 = Band.create(name: "Giant Potato")
band2 = Band.create(name: "Mikey Totes")
band3 = Band.create(name: "Wheels of Fortune: Extreme")
band4 = Band.create(name: "Singers of all nation")
band5 = Band.create(name: "Cation Anion")

album1 = Album.create(band_id: band1.id, name: "Big one!", year: 2020, live: true)
album2 = Album.create(band_id: band1.id, name: "Second Big one!", year: 2040, live: true)
album3 = Album.create(band_id: band4.id, name: "All over ZAWARUDO!", year: 2030, live: true)
album4 = Album.create(band_id: band3.id, name: "Round and Round!", year: 2020, live: true)

track1 = Track.create!(
  name: "First go!",
  album_id: album1.id,
  ord: 1,
  bonus: true,
  lyrics: "SUPER BIG BOIS HERE WE GO"
)

track2 = Track.create!(
  name: "Second go!",
  album_id: album2.id,
  ord: 2,
  bonus: true,
  lyrics: "EVEN BIGGER HERE WE GO"
)

track3 = Track.create!(
  name: "Big Mojo",
  album_id: album3.id,
  ord: 4,
  bonus: true,
  lyrics: "Lets go on a Bizzare Adventure"
)

track4 = Track.create!(
  name: "First go!",
  album_id: album4.id,
  ord: 2,
  bonus: true,
  lyrics: "So circular so spectacular"
)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "deleting all Movies"
Bookmark.destroy_all
Movie.destroy_all

url = "https://tmdb.lewagon.com/movie/top_rated"
user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)

puts "creating Movies"
user["results"].each do |movie|
  Movie.create(
    title: movie["original_title"],
    overview: movie["overview"],
    rating: movie["vote_average"],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"
  )
  puts "#{movie["original_title"]}"
end

puts "Done"

# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!
puts "Studios: #{Studio.all.count}"
puts "Movies: #{Movie.all.count}"
puts "Actors: #{Actor.all.count}"
puts "Roles: #{Role.all.count}"

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

#Create studios:
warner_bros = Studio.new
warner_bros["name"] = "Warner Bros."
warner_bros.save

puts "Studios: #{Studio.all.count}"

#Create movies:
wb = Studio.find_by({"name" => "Warner Bros."})

batman_begins = Movie.new
batman_begins["title"] = "Batman Begins"
batman_begins["year_released"] = 2005
batman_begins["rated"] = "PG-13"
batman_begins["studio_id"] = wb["id"]
batman_begins.save

dark_knight = Movie.new
dark_knight["title"] = "The Dark Knight"
dark_knight["year_released"] = 2008
dark_knight["rated"] = "PG-13"
dark_knight["studio_id"] = wb["id"]
dark_knight.save

dark_knight_rises = Movie.new
dark_knight_rises["title"] = "The Dark Knight Rises"
dark_knight_rises["year_released"] = 2012
dark_knight_rises["rated"] = "PG-13"
dark_knight_rises["studio_id"] = wb["id"]
dark_knight_rises.save

puts "Movies: #{Movie.all.count}"

#Create actors:
christian_bale = Actor.new
christian_bale["name"] = "Christian Bale"
christian_bale.save

michael_caine = Actor.new
michael_caine["name"] = "Michael Caine"
michael_caine.save

liam_neeson = Actor.new
liam_neeson["name"] = "Liam Neeson"
liam_neeson.save

katie_holmes = Actor.new
katie_holmes["name"] = "Katie Holmes"
katie_holmes.save

gary_oldman = Actor.new
gary_oldman["name"] = "Gary Oldman"
gary_oldman.save

heath_ledger = Actor.new
heath_ledger["name"] = "Heath Ledger"
heath_ledger.save

aaron_eckhart = Actor.new
aaron_eckhart["name"] = "Aaron Eckhart"
aaron_eckhart.save

maggie_gyllenhall = Actor.new
maggie_gyllenhall["name"] = "Maggie Gyllenhaal"
maggie_gyllenhall.save

tom_hardy = Actor.new
tom_hardy["name"] = "Tom Hardy"
tom_hardy.save

joseph_gl = Actor.new
joseph_gl["name"] = "Joseph Gordon-Levitt"
joseph_gl.save

anne_hathaway = Actor.new
anne_hathaway["name"] = "Anne Hathaway"
anne_hathaway.save

puts "Actors: #{Actor.all.count}"

#Create roles:
bb = Movie.find_by({"title" => "Batman Begins"})
tdk = Movie.find_by({"title" => "The Dark Knight"})
tdkr = Movie.find_by({"title" => "The Dark Knight Rises"})

c_b = Actor.find_by({"name" => "Christian Bale"})
m_c = Actor.find_by({"name" => "Michael Caine"})
l_n = Actor.find_by({"name" => "Liam Neeson"})
k_h = Actor.find_by({"name" => "Katie Holmes"})
g_o = Actor.find_by({"name" => "Gary Oldman"})
h_l = Actor.find_by({"name" => "Heath Ledger"})
a_e = Actor.find_by({"name" => "Aaron Eckhart"})
m_g = Actor.find_by({"name" => "Maggie Gyllenhaal"})
t_h = Actor.find_by({"name" => "Tom Hardy"})
j_g_l = Actor.find_by({"name" => "Joseph Gordon-Levitt"})
a_h = Actor.find_by({"name" => "Anne Hathaway"})

#Batman Begins:

bruce_wayne_bb = Role.new
bruce_wayne_bb["movie_id"] = bb["id"]
bruce_wayne_bb["actor_id"] = c_b["id"]
bruce_wayne_bb["character_name"] = "Bruce Wayne"
bruce_wayne_bb.save

alfred_bb = Role.new
alfred_bb["movie_id"] = bb["id"]
alfred_bb["actor_id"] = m_c["id"]
alfred_bb["character_name"] = "Alfred"
alfred_bb.save

ras_al_ghul_bb = Role.new
ras_al_ghul_bb["movie_id"] = bb["id"]
ras_al_ghul_bb["actor_id"] = l_n["id"]
ras_al_ghul_bb["character_name"] = "Ra's Al Ghul"
ras_al_ghul_bb.save

rachel_dawes_bb = Role.new
rachel_dawes_bb["movie_id"] = bb["id"]
rachel_dawes_bb["actor_id"] = k_h["id"]
rachel_dawes_bb["character_name"] = "Rachel Dawes"
rachel_dawes_bb.save

commissioner_gordon_bb = Role.new
commissioner_gordon_bb["movie_id"] = bb["id"]
commissioner_gordon_bb["actor_id"] = g_o["id"]
commissioner_gordon_bb["character_name"] = "Commissioner Gordon"
commissioner_gordon_bb.save

#The Dark Knight
bruce_wayne_tdk = Role.new
bruce_wayne_tdk["movie_id"] = tdk["id"]
bruce_wayne_tdk["actor_id"] = c_b["id"]
bruce_wayne_tdk["character_name"] = "Bruce Wayne"
bruce_wayne_tdk.save

joker_tdk = Role.new
joker_tdk["movie_id"] = tdk["id"]
joker_tdk["actor_id"] = h_l["id"]
joker_tdk["character_name"] = "Joker"
joker_tdk.save

harvey_dent_tdk = Role.new
harvey_dent_tdk["movie_id"] = tdk["id"]
harvey_dent_tdk["actor_id"] = a_e["id"]
harvey_dent_tdk["character_name"] = "Harvey Dent"
harvey_dent_tdk.save

alfred_tdk = Role.new
alfred_tdk["movie_id"] = tdk["id"]
alfred_tdk["actor_id"] = m_c["id"]
alfred_tdk["character_name"] = "Alfred"
alfred_tdk.save

rachel_dawes_tdk = Role.new
rachel_dawes_tdk["movie_id"] = tdk["id"]
rachel_dawes_tdk["actor_id"] = m_g["id"]
rachel_dawes_tdk["character_name"] = "Rachel Dawes"
rachel_dawes_tdk.save

#The Dark Knight Rises

bruce_wayne_tdkr = Role.new
bruce_wayne_tdkr["movie_id"] = tdkr["id"]
bruce_wayne_tdkr["actor_id"] = c_b["id"]
bruce_wayne_tdkr["character_name"] = "Bruce Wayne"
bruce_wayne_tdkr.save

commissioner_gordon_tdkr = Role.new
commissioner_gordon_tdkr["movie_id"] = tdkr["id"]
commissioner_gordon_tdkr["actor_id"] = g_o["id"]
commissioner_gordon_tdkr["character_name"] = "Commissioner Gordon"
commissioner_gordon_tdkr.save

bane_tdkr = Role.new
bane_tdkr["movie_id"] = tdkr["id"]
bane_tdkr["actor_id"] = t_h["id"]
bane_tdkr["character_name"] = "Bane"
bane_tdkr.save

john_blake_tdkr = Role.new
john_blake_tdkr["movie_id"] = tdkr["id"]
john_blake_tdkr["actor_id"] = j_g_l["id"]
john_blake_tdkr["character_name"] = "John Blake"
john_blake_tdkr.save

selina_kyle_tdkr = Role.new
selina_kyle_tdkr["movie_id"] = tdkr["id"]
selina_kyle_tdkr["actor_id"] = a_h["id"]
selina_kyle_tdkr["character_name"] = "Selina Kyle"
selina_kyle_tdkr.save

puts "Roles: #{Role.all.count}"

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

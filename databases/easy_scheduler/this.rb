##just type in yes on the prompts to populate the database or leave blank and press enter to exit. 

require 'sqlite3'
##create database
$db = SQLite3::Database.new("derby.db")
##create table players
create_table_cmd = <<-SQL
  CREATE TABLE if NOT EXISTS players(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    num INTEGER,
    team_id INTEGER,
    FOREIGN KEY (team_id) REFERENCES teams(id)
  )
SQL
#execute create table
$db.execute(create_table_cmd)
#create table teams
create_table_cmd = <<-SQL
  CREATE TABLE if NOT EXISTS teams(
    id INTEGER,
    team_name VARCHAR(255)
  )
SQL
##exectue create table
$db.execute(create_table_cmd)
##method to insert into table players

$db.execute("INSERT INTO players (name, num, team_id) VALUES ('Paula Bunion', 45, 1)")
$db.execute("INSERT INTO players (name, num, team_id) VALUES ('Grave Danger', 6, 2)")
$db.execute("INSERT INTO players (name, num, team_id) VALUES ('April Bloodgate', 12, 2)")
$db.execute("INSERT INTO players (name, num, team_id) VALUES ('Beyonslay', 7, 1)")

##method to insert into teams

$db.execute("INSERT INTO teams (id, team_name) VALUES (1, 'Wrecking Belles')")
$db.execute("INSERT INTO teams (id, team_name) VALUES (2, 'Team Unicorn')")
$db.execute("INSERT INTO teams (id, team_name) VALUES (2, 'Team Unicorn')")
$db.execute("INSERT INTO teams (id, team_name) VALUES (1, 'wrecking Belles')")

#query to return all from players
derby = $db.prepare("SELECT * FROM players")
  p derby.columns
  print_row = derby.execute
    print_row.each do |row|
    puts row.join "\s"
end

puts "-------------------------"
##query to return all from teams
t_eam = $db.prepare("SELECT * FROM teams")
  p t_eam.columns
  print_row = t_eam.execute
    print_row.each do |row|
    puts row.join "\s"
end

puts "-------------------------"
##query to return player with id 1
p $db.execute("SELECT * FROM players WHERE id = 1")

puts "-------------------------"
##query to return a joined table
joined = $db.prepare("SELECT name, team_name FROM players, teams WHERE players.team_id = teams.id;")
  p joined.columns
  print_row = joined.execute
    print_row.each do |row|
    puts row.join "\s"
end

puts "-------------------------"
##query to return a joined table
also_joined = $db.prepare("SELECT players.name, teams.team_name FROM players JOIN teams ON players.team_id = teams.id;")
  p also_joined.columns 
  print_row = also_joined.execute
    print_row.each do |row|
    puts row.join "\s"
end

puts "-------------------------"


##user interface. This was used to control the creation of the tables. 
# puts "do you want to insert into players"
#   answer = gets.chomp.downcase
#     if answer == "yes"
#       insert
#     end

# puts "do you want to insert into teams"
#   answer = gets.chomp.downcase
#     if answer == "yes"
#       insert_team
#     end
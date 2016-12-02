# require gems
require 'sinatra'
require 'sqlite3'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# show students on the home page
get '/' do
  @students = db.execute("SELECT * FROM students")
  @campus = db.execute("SELECT * FROM campuses")
  erb :home
end

get '/students/new' do
  erb :new_student
end

# create new students via
# a form
post '/students' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

get '/by_campus' do
  @students = db.execute("SELECT * FROM students ORDER BY campus")
  erb :template
end

get '/campuses/new' do
  erb :newcampus
end

post '/campuses' do
  db.execute("INSERT INTO campuses (campus) VALUES (?)", [params['campus']])
  redirect '/'
end

# get '/campuses/list' do
#   @campus = db.execute("SELECT * FROM campuses")
#   erb :campuslist
# end




# add static resources
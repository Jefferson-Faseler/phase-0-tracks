require 'sqlite3'
require_relative 'scheduler'

def create_user(username)
  $database.execute("INSERT INTO users (name) VALUES (?)", [username])
end

def find_username(username)
  user = $database.execute("SELECT name FROM USERS WHERE name = ?", [username])
end


def add_to_db(day_id, time, username)
  user_id = find_user_id(username)
  $database.execute("
    INSERT INTO schedules (user_id, day_id, time)
    VALUES (?,?,?)", [user_id, day_id, time])
  duplicate_time?(user_id, day_id, time)
end

    def duplicate_time?(user_id, day_id, time)
      count = $database.execute("
        SELECT COUNT(*)
        FROM schedules
        WHERE user_id = ?
        AND day_id = ?
        AND time = ?
        AND id <> ( SELECT MIN(id)
        FROM schedules
        GROUP BY time
        HAVING COUNT(*) > 1);
        ", [user_id, day_id, time]).flatten.join.to_i
      if count >= 2 
        remove_duplicates!(user_id, day_id, time)
      end
    end

    def remove_duplicates!(user_id, day_id, time)
      $database.execute("
      DELETE FROM schedules
      WHERE user_id = ?
      AND day_id = ?
      AND time = ?
      AND id IN ( SELECT MAX(id)
      FROM schedules
      GROUP BY time
      HAVING COUNT(*) > 1);
      ", [user_id, day_id, time])
    end


def delete_from_db!(day, time, username)
  user_id = find_user_id(username)
  day_id = find_day_id(day)
  $database.execute("
    DELETE FROM schedules
    WHERE user_id = ?
    AND day_id = ?
    AND time = ?", [user_id, day_id, time])
end


def print_schedule(username)
  user_id = find_user_id(username)
  print_days = find_days(user_id)
  puts "#{username}'s schedule for this week:"
  print_days.each do |day|
    puts "On #{day}"
    day_id = find_day_id(day)
    print find_times(user_id, day_id)
    print "\n"
  end
end

      
def compare_user_days(username, second_user)
  user_id = find_user_id(username).to_i
  second_user_id = find_user_id(second_user).to_i
  num_of_matching_times = $database.execute(" 
    SELECT COUNT(*)
    FROM schedules
    WHERE user_id = ?
    OR user_id = ?", [user_id, second_user_id]).flatten.join.to_i
  if num_of_matching_times >= 1
    compare_and_print_user_times(user_id, second_user_id)
  else
    puts "Sorry, it looks like your schedules don't line up this week."
  end
end

    def compare_and_print_user_times(user_id, second_user_id)
      matching_day_ids = $database.execute("
        SELECT DISTINCT day_id 
        FROM schedules 
        WHERE user_id = ?
        OR user_id = ?", [user_id, second_user_id]).flatten
      matching_day_ids.each do |day|
        user_times = find_times(user_id, day)
        second_user_times = find_times(second_user_id, day)
        puts "You can meet on:"
        puts $database.execute("SELECT day FROM days WHERE id = ?", [day])
        print "At: "
        print user_times & second_user_times
        print "\n"
      end
    end


def find_day_id(day)
  $database.execute("SELECT id FROM days WHERE day = ?", [day]).flatten.join
end

def find_user_id(username)
  $database.execute("SELECT id FROM users WHERE name = ?", [username]).flatten.join
end

def find_days(user_id)
  $database.execute("
  SELECT day
  FROM days
  WHERE id IN (
  SELECT day_id
  FROM schedules
  WHERE user_id= ?
  )", [user_id]).flatten
end

def find_times(user_id, day_id)
  $database.execute("
  SELECT time
  FROM schedules
  WHERE user_id= ?
  AND day_id = ?
  ORDER BY time", [user_id, day_id]).flatten
end
default = {
  migrations: true,
  branch: "master",
  remote: "heroku"
}

puts "****************************"
puts "Deploying to Heroku!"
puts "****************************"
puts "On: #{default[:branch]}"
puts "Remote: #{default[:remote]}"
puts "****************************"

system "git push #{default[:remote]} #{default[:branch]}:master"

# Run migrations
if default[:migrations] == true
  puts "****************************"
  puts "Running Migrations!"
  puts "****************************"

  puts "Backing up database!"
  system "heroku pgbackups:capture --expire --remote #{default[:remote]}"

  puts "Putting site in maintenance mode..."
  system "heroku maintenance:on --remote #{default[:remote]}"

  puts "Running migrations!"
  system "heroku run rake db:migrate --remote #{default[:remote]}"

  puts "Taking site out of maintenance mode!"
  system "heroku maintenance:off --remote #{default[:remote]}"
end

puts "Done!  Your code is now live."

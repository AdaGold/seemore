# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# user seeds
users = [
  { name: "Example1" },
  { name: "Example2" }
]

users.each do |user|
  User.create(user)
end

# handle seeds
handles = [
  { name: "@google", uri: "www.google.com" },
  { name: "testing1", uri: "website uri" },
  { name: "testing2", uri: "another website uri" }
]

handles.each do |handle|
  Handle.create(handle)
end

# media seeds
media = [
  { type: "Tweet", handle_id: "1", text: "look I'm tweeting", tweet_time: 1.hour.ago },
  { type: "Tweet", handle_id: "1", text: "more tweeting wow", tweet_time: 2.hours.ago },
  { type: "Tweet", handle_id: "2", text: "even more tweeting", tweet_time: 3.hours.ago },
  { type: "Video", handle_id: "2", text: "I'm a video", tweet_time: 4.hours.ago },
  { type: "Video", handle_id: "2", text: "I'm a second video", tweet_time: 1.day.ago },
  { type: "Video", handle_id: "1", text: "I'm a third video", tweet_time: 3.days.ago }
]

media.each do |medium|
  Medium.create(medium)
end

# all together
# this works best if you sign in on your local host via twitter first, to create
# yourself as a User before doing db:seed. This is so you can actually see the
# timeline with seed feed

user = User.find(1)
user.handles << Handle.find(1)
user.handles << Handle.find(2)

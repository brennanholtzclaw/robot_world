# require_relative '../test_helper'
#
# class UserCreatesRobotTest < Minitest::Test
#   include Capybara::DSL
#   include TestHelpers
#
#   def create_robots(num)
#     num.times do |i|
#       robot_world.create(
#         name:       "title#{i+1}",
#         city:       "city",
#         state:      "state",
#         birthdate:  "01-01-01",
#         department: "department",
#         date_hired: "#{Time.now.strftime("%m-%d-%y")}"
#       )
#     end
#   end
#
#   def create_other_robots(num)
#     num.times do |i|
#       robot_world.create(
#         name:       "name#{i+1}",
#         city:       "cityville",
#         state:      "statehood",
#         birthdate:  "01-01-02",
#         department: "deputy",
#         date_hired: "#{Time.now.strftime("%m-%d-%y")}"
#       )
#     end
#   end
#
#   def test_user_can_see_statistical_data
#     create_robots(5)
#     create_other_robots(5)
#
#     visit '/'
#
#     within('#age') do
#       save_and_open_page
#       assert page.has_content? '15'
#     end
#
#     within('#year') do
#       assert page.has_content? 'In the year 2016 there were 10 robots hired.'
#     end
#
#     within('#department') do
#       assert page.has_content? 'There are currently 10 robots working in the department department.'
#     end
#
#     within('#city') do
#       assert page.has_content? "There are currently 10 robots working in the town of city."
#     end
#
#     within('#state') do
#       assert page.has_content? "There are currently 10 robots working in the state of state."
#     end
#
#   end
#
# end

require_relative '../test_helper'

class UserCreatesRobotTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers

  def test_user_can_delete_a_robot
    data =  { :name        => "frank",
              :city        => "denver",
              :state       => "CO",
              :birthdate   => "09-29-12",
              :department  => "history",
              :date_hired  => "02-01-01"}

    robot_world.create(data)
    robot = robot_world.all.first

    visit '/robots'

    click_link("Edit this Robot's Information")

    assert_equal "/robots/#{robot.id}/edit", current_path
    fill_in("robot[name]", with: "Test Robot")
    fill_in("robot[city]", with: "Test Robot city")
    fill_in("robot[state]", with: "Test Robot state")
    fill_in("robot[birthdate]", with: "01-23-45")
    fill_in("robot[department]", with: "Test Robot department")
    click_button("Submit Form")

    assert_equal '/robots', current_path
    within('.robots') do
      assert page.has_content? 'Test Robot'
    end
  end

end

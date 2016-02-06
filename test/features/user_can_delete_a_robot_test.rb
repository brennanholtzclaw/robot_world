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

    visit '/robots'

    within('#all-robots') do
      assert page.has_content? "Here is all of the Robots currently on Robot World"
    end

    click_button "Delete this Robot"

    assert_equal '/robots', current_path

    within('#all-robots') do
      assert page.has_content? "Here is all of the Robots currently on Robot World"
    end
  end

end

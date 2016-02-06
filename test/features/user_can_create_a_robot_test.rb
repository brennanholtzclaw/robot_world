require_relative '../test_helper'

class UserCreatesRobotTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers

  def test_user_creates_a_robot
    visit '/'

    click_link("Make a new robot of your own!")
    assert_equal '/robots/new', current_path
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

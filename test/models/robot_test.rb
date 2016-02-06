require_relative '../test_helper'

class RobotTest < Minitest::Test

  def test_data_is_assigned_correctly
    data =  {:name=>"frank", :city=>"denver", :state=>"CO", :avatar => nil,
            :birthdate=>"09-29-12", :department=>"history",
            :date_hired=>"02-01-01"}

    robot = Robot.new(data)

    assert_equal "frank", robot.name
    assert_equal "denver", robot.city
    assert_equal "CO", robot.state
    assert_equal "09-29-12", robot.birthdate
    assert_equal "history", robot.department
    assert_equal "02-01-01", robot.date_hired
  end
end

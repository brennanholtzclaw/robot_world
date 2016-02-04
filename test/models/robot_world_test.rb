require_relative '../test_helper'

class RobotWorldTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_robot
    data =  { :name        => "frank",
              :city        => "denver",
              :state       => "CO",
              :birthdate   => "09-29-12",
              :department  => "history",
              :date_hired  => "02-01-01"}

    robot_world.create(data)
    robot = robot_world.all.last

    assert_equal "frank", robot.name
    assert_equal "denver", robot.city
    assert_equal "history", robot.department
    assert robot.id
  end

  def test_it_can_find_all_robots
    data =  { :name        => "frank",
              :city        => "denver",
              :state       => "CO",
              :birthdate   => "09-29-12",
              :department  => "history",
              :date_hired  => "02-01-01"}

    data2 = { :name        => "phil",
              :city        => "longmont",
              :state       => "MI",
              :birthdate   => "08-28-11",
              :department  => "future",
              :date_hired  => "01-31-00"}

    robot_world.create(data)
    robot_world.create(data2)
    robot1 = robot_world.all[-2]
    robot2 = robot_world.all[-1]

    assert_equal 2, robot_world.all.count
    refute_equal 3, robot_world.all.count
    assert_equal "frank", robot_world.all.first.name
    assert_equal "phil", robot_world.all.last.name
  end

  def test_it_can_find_a_robot_by_id
    data =  { :name        => "frank",
              :city        => "denver",
              :state       => "CO",
              :birthdate   => "09-29-12",
              :department  => "history",
              :date_hired  => "02-01-01"}

    data2 = { :name        => "phil",
              :city        => "longmont",
              :state       => "MI",
              :birthdate   => "08-28-11",
              :department  => "future",
              :date_hired  => "01-31-00"}

    robot_world.create(data)
    robot_world.create(data2)
    robot1 = robot_world.all[-2]
    robot2 = robot_world.all[-1]

    assert_equal "longmont", robot_world.find(2).city
    assert_equal "history", robot_world.find(1).department
  end

  def test_it_can_update_a_robots_information
    data =  { :name        => "frank",
              :city        => "denver",
              :state       => "CO",
              :birthdate   => "09-29-12",
              :department  => "history",
              :date_hired  => "02-01-01"}

    data2 = { :name        => "phil",
              :city        => "longmont",
              :state       => "MI",
              :birthdate   => "08-28-11",
              :department  => "future",
              :date_hired  => "01-31-00"}

    robot_world.create(data)
    robot1 = robot_world.all.first
    assert_equal "frank", robot1.name
    refute_equal "phil", robot1.name

    robot_world.update(data2, 1)
    robot1 = robot_world.all.first

    assert_equal "phil", robot1.name
    refute_equal "frank", robot1.name
  end

  def test_it_can_delete_a_robot
    data =  { :name        => "frank",
              :city        => "denver",
              :state       => "CO",
              :birthdate   => "09-29-12",
              :department  => "history",
              :date_hired  => "02-01-01"}

    data2 = { :name        => "phil",
              :city        => "longmont",
              :state       => "MI",
              :birthdate   => "08-28-11",
              :department  => "future",
              :date_hired  => "01-31-00"}

    robot_world.create(data)
    robot_world.create(data2)
    robot_world.delete(1)

    assert_equal 1, robot_world.all.count
    assert_equal "phil", robot_world.all.first.name
  end
end

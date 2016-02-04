ENV["RACK_ENV"] ||= "test"

require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'
require 'capybara/dsl'
require 'tilt/erb'

Capybara.app = RobotWorldApp

Capybara.save_and_open_page_path = "tmp/capybara"

module TestHelpers

  def teardown
    robot_world.delete_all
    super
  end

  def robot_world
    database = YAML::Store.new('db/robot_world_test')
    @robot_world ||= RobotWorld.new(database)
  end

end

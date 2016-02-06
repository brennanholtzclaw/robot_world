require 'yaml/store'

class RobotWorld
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.from(:robots).insert(robot)
    # database.transaction do
    #   database["robots"] ||= []
    #   database["total"] ||= 0
    #   database["total"] += 1
    #   database["robots"] << { "id" => database["total"], "name" => robot[:name],
    #                           "city" => robot[:city], "state" => robot[:state],
    #                           "avatar" => nil, "birthdate" => robot[:birthdate],
    #                           "date_hired" => robot[:date_hired],
    #                           "department" => robot[:department]}
    # end
  end

  # def raw_tasks
  #   database.transaction do
  #     database['robots'] || []
  #   end
  # end
  #
  # def raw_task(id)
  #   raw_tasks.find {|robot| robot["id"] == id}
  # end

  def all
    database.from(:robots).to_a.map {|data| Robot.new(data)}
    # raw_tasks.map { |data| Robot.new(data)}
  end

  def dataset
    database.from(:robots)
  end

  def find(id)
    robots = dataset.where(:id => id).to_a.first
    Robot.new(robot)
    # Robot.new(raw_task(id))
  end

  def update(robot, id)
    dataset.where(:id => id).update(robot)
    # database.transaction do
    #   target = database['robots'].find {|robot| robot["id"] == id}
    #   target["name"] = robot[:name]
    #   target["city"] = robot[:city]
    #   target["state"] = robot[:state]
    #   target["avatar"] = robot[:avatar]
    #   target["birthdate"] = robot[:birthdate]
    #   target["date_hired"] = robot[:date_hired]
    #   target["department"] = robot[:department]
    # end
  end

  def delete(id)
    dataset.where(:id => id).delete
    # database.transaction do
    #   database['robots'].delete_if { |robot| robot["id"] == id }
    # end
  end

end

require 'yaml/store'

class RobotWorld
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.transaction do
      database["robots"] ||= []
      database["total"] ||= 0
      database["total"] += 1
      database["robots"] << { "id" => database["total"], "name" => robot[:name],
                              "city" => robot[:city], "state" => robot[:state],
                              "avatar" => nil, "birthdate" => robot[:birthdate],
                              "date_hired" => robot[:date_hired],
                              "department" => robot[:department]}

    end
  end

  def raw_tasks
    database.transaction do
      database['robots'] || []
    end
  end

  def all
    raw_tasks.map { |data| Robot.new(data)}
  end

  def raw_task(id)
    raw_tasks.find {|robot| robot["id"] == id}
  end

  def find(id)
    Robot.new(raw_task(id))
  end

  def update(robot, id)
    database.transaction do
      target = database['robots'].find {|robot| robot["id"] == id}
      target["name"] = robot[:name]
      target["city"] = robot[:city]
      target["state"] = robot[:state]
      target["birthdate"] = robot[:birthdate]
      target["date_hired"] = robot[:date_hired]
      target["department"] = robot[:department]
    end
  end

  def delete(id)
    database.transaction do
      database['robots'].delete_if { |robot| robot["id"] == id }
    end
  end

  def delete_all #hacky method written for test helper
    database.transaction do
      database['robots'] = []
      database['total'] = 0
    end
  end


end

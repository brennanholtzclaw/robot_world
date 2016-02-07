class RobotWorld
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.from(:robots).insert(robot)
  end

  def all
    database.from(:robots).to_a.map {|data| Robot.new(data)}
  end

  def dataset
    database.from(:robots)
  end

  def find(id)
    robot = dataset.where(:id => id).to_a.first
    Robot.new(robot)
  end

  def update(robot, id)
    dataset.where(:id => id).update(robot)
  end

  def delete(id)
    dataset.where(:id => id).delete
  end

  def avg_robot_age
    total = dataset.inject(0) do |sum, robot|
      sum + (Time.now.strftime("%y").to_i - robot[:birthdate][-2..-1].to_i)
    end
    (total/(dataset.all.count + 0.001)).to_i
  end

  def hired_each_year
    groups = dataset.to_a.group_by {|robot| robot[:date_hired][-2..-1]}
    groups.map do |key, value|
      p "In the year 20#{key} there were #{value.count} robots hired.\n"
    end
  end

  def per_department
    groups = dataset.to_a.group_by {|robot| robot[:department]}
    groups.map do |key, value|
      p "There are currently #{value.count} robots working in the #{key} department.\n"
    end
    # "3.2"
  end

  def per_city
    groups = dataset.to_a.group_by {|robot| robot[:city]}
    groups.map do |key, value|
      p "There are currently #{value.count} robots working in the town of #{key}.\n"
    end
  end

  def per_state
    groups = dataset.to_a.group_by {|robot| robot[:state]}
    groups.map do |key, value|
      p "There are currently #{value.count} robots working in the state of #{key}.\n"
    end
  end

end

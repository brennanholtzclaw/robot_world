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

end

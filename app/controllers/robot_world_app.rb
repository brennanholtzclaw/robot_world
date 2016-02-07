# require 'yaml/store'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/' do
    @robot_world = robot_world
    erb :dashboard
  end

  get '/robots' do
    @robots = robot_world.all
    erb :index
  end

  get '/robots/new' do
    erb :new_robot
  end

  post '/robots' do
    robot_world.create(params[:robot])
    redirect'/robots'
  end

  get '/robots/:id' do |id|
    @robot = robot_world.find(id.to_i)
    erb :robo_show
  end

  get '/robots/:id/edit' do |id|
    @robot = robot_world.find(id.to_i)
    erb :robo_edit
  end

  put '/robots/:id' do |id|
    robot_world.update(params[:robot], id.to_i)
    redirect '/robots'
  end

  delete '/robots/:id' do |id|
    robot_world.delete(id.to_i)
    redirect '/robots'
  end

  not_found do
    erb :error
  end

  def robot_world
    if ENV["RACK_ENV"] == "test"
      database = Sequel.sqlite("db/robot_world_test.sqlite3")
    else
      database = Sequel.sqlite("db/robot_world_development.sqlite3")
    end
    @robot_world ||= RobotWorld.new(database)
  end
end

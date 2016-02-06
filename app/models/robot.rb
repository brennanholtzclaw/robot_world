class Robot
  attr_reader :name, :city, :state,
              :avatar, :birthdate,
              :date_hired, :department,
              :id, :message

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @city = data[:city]
    @state = data[:state]
    @avatar = data[:avatar]
    @birthdate = data[:birthdate]
    @date_hired = data[:date_hired]
    @department = data[:department]
    @message = "My name is #{name} and I am programmed for #{department}.".unpack("B*").first
  end


end

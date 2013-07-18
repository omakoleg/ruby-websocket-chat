class ClientEntity
  attr_accessor :socket
  
  def initialize(socket)
    self.socket = socket
  end
  
  def notify message
    socket.send( message )
  end
  
end
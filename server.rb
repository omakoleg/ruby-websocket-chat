require 'eventmachine'
require 'em-websocket'
require 'json'
require File.join(File.dirname(__FILE__), 'client_entity') 

EventMachine.run {
  list = []
  EventMachine::WebSocket.start(:host=> "0.0.0.0", :port => 8080) do |ws|
    ws.onopen {
      puts 'Connection open'
      list << ClientEntity.new(ws)
      ws.send "you are connected"
    }
    
    ws.onclose{
      puts 'Connection closed'
    }
    
    ws.onmessage do |msg|
      list.each do |item|
        item.notify msg
      end
    end
    
  end

}
require 'eventmachine'
require 'em-websocket'

module WebSocketServer
  def post_init
    puts "WebSocket Sunucusu başlatıldı!"
  end

  def on_message(msg)
    puts "Alınan WebSocket mesajı: #{msg}"
    send(msg)
  end
end

EventMachine.run do
  EventMachine::WebSocket.start(host: '0.0.0.0', port: 8080) do |ws|
    ws.onopen { puts "WebSocket bağlantısı açıldı!" }
    ws.onmessage { |msg| ws.on_message(msg) }
    ws.onclose { puts "WebSocket bağlantısı kapatıldı!" }
  end
  puts "WebSocket Sunucusu başlatıldı, 8080 portunu dinliyor."
end

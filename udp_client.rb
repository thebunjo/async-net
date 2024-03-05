require 'eventmachine'

module UDPClientExample
  def post_init
    send_datagram "Merhaba, UDP Sunucusu!", '127.0.0.1', 12345
  end

  def receive_data(data)
    puts "Alınan cevap: #{data}"
    EventMachine.stop
  end
end

EventMachine.run do
  EventMachine.open_datagram_socket '0.0.0.0', nil, UDPClientExample
end

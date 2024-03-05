require 'eventmachine'

module TCPClientExample
  def post_init
    send_data "Merhaba, TCP Sunucusu!"
  end

  def receive_data(data)
    puts "Alınan cevap: #{data}"
    close_connection
  end
end

EventMachine.run do
  EventMachine.connect '127.0.0.1', 1234, TCPClientExample
end

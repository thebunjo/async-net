require 'eventmachine'

module TCPServerExample
  def post_init
    puts "Yeni bir bağlantı geldi!"
  end

  def receive_data(data)
    puts "Alınan veri: #{data}"
    send_data "Merhaba, #{data}"
  end

  def unbind
    puts "Bağlantı kapatıldı!"
  end
end

EventMachine.run do
  EventMachine.start_server '0.0.0.0', 1234, TCPServerExample
  puts "TCP Sunucusu başlatıldı, 1234 portunu dinliyor."
end

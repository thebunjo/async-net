require 'eventmachine'

module UDPServerExample
  def post_init
    puts "UDP sunucusu başlatıldı, 12345 portunu dinliyor."
  end

  def receive_data(data, sender_info)
    puts "Alınan UDP verisi: #{data} - Gönderen: #{sender_info[2]}, Port: #{sender_info[1]}"
    send_data "Merhaba, #{data}", sender_info[2], sender_info[1]
  end
end

EventMachine.run do
  EventMachine.open_datagram_socket '0.0.0.0', 12345, UDPServerExample
end

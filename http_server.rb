require 'eventmachine'
require 'em-http-server'

class HTTPServer < EM::HttpServer::Server
  def process_http_request
    response = EM::DelegatedHttpResponse.new(self)
    response.status = 200
    response.content_type 'text/html'
    response.content = 'Merhaba, HTTP Sunucusu!'
    response.send_response
  end
end

EventMachine.run do
  EventMachine.start_server '0.0.0.0', 8081, HTTPServer
  puts "HTTP Sunucusu başlatıldı, 8081 portunu dinliyor."
end

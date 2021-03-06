require 'socket'
PORT = 8080
server = TCPServer.open PORT
puts "Starting server on port #{PORT}"

loop {
  Thread.start(server.accept()) do |client|
    resp = "Request"
    headers = ["HTTP/1.1 200 OK",
               "Date: #{Time.now()}",
               "Server: Ruby",
               "Content-Type: text/html",
               "Content-Length: #{resp.length}\r\n\r\n"].join("\r\n")
    client.puts headers
    client.puts resp
    client.close
  end
}

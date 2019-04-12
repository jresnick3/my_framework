# monroe.rb

# This is a framework for the server

class Monroe
  def response(status, header, body = '')
    body = yield if block_given?
    [status, header, [body]]
  end

  def erb(filename, local = {})
    b = binding
    message = local[:message]
    content = File.read("views/#{filename}.erb")
    ERB.new(content).result(b)
  end
end

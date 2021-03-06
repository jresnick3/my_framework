# app.rb

require_relative "advice"
require_relative "monroe"
require "sinatra"

class App < Monroe
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      status = '200'
      header = {"Content-Type" => 'text/html'}
      response(status, header) do
        erb(:index)
      end
    when '/advice'
      piece_of_advice = Advice.new.generate
      status = '200'
      header = {"Content-Type" => 'text/html'}
      response(status, header) do
        erb(:advice, message: piece_of_advice)
      end
    else
      status = '404'
      header = {"Content-Type" => 'text/html', "Content-Length" => '61'}
      response(status, header) do
        erb(:not_found)
      end
    end
  end
end

require './app/checkr'
require 'rspec'
require 'rack/test'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

describe Checkr do
  def app
    Checkr.new
  end

  it 'root should return "hello world"' do
    get '/'
    expect(last_response.body).to eq('hello world')
  end
end
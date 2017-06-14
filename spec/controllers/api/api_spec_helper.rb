require_relative "../../rails_helper"

require 'rack/test'

Dir[File.expand_path(File.join(File.dirname(__FILE__), 'api', '**', '*.rb'))].each { |f| require f }

RSpec.configure do |config|
  config.include Rack::Test::Methods, type: :request
  config.include RSpec::Rails::RequestExampleGroup, type: :request, file_path: File.join('app', 'controllers', 'api', '**', '*.rb')
end

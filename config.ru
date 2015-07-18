#\ -s puma
require 'sinatra/base'
require 'sinatra'
require 'rake'
require 'puma'

require ::File.expand_path('../app',  __FILE__)

set :app_file, __FILE__

configure do
  set :views, File.join(Sinatra::Application.root, "app", "views")
end

run Sinatra::Application

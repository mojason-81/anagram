require 'sinatra/base'
require 'sinatra'
require 'rake'
require 'will_paginate'
require 'will_paginate/active_record'

require ::File.expand_path('../app',  __FILE__)

set :app_file, __FILE__

WillPaginate.per_page = 25

configure do
  set :views, File.join(Sinatra::Application.root, "app", "views")
end

run Sinatra::Application
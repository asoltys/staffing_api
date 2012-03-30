require 'sinatra'
require 'sinatra/authorization'
require 'active_record'

module Staffing
  class Position < ActiveRecord::Base
  end

  class Process < ActiveRecord::Base
  end
end

before do
   config = YAML::load( File.open('database.yml') )['development']
   ActiveRecord::Base.establish_connection(config)
end

get '/positions' do
  Position.all.to_json
end

get '/processes' do
  Staffing::Process.all.as_json.to_s
end


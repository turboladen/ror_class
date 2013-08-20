require 'parade'
require 'sass/plugin/rack'

use Sass::Plugin::Rack

current_dir = File.expand_path(File.dirname(__FILE__))

D1 = Class.new(Parade::Server) do
  set :presentation_directory, "#{current_dir}/d1"
  set :presentation_file, "#{current_dir}/d1/parade"
  register_stylesheet("#{current_dir}/public/stylesheets/default_overrides.css")
end

run Rack::URLMap.new(
  '/d1' => D1.new
)

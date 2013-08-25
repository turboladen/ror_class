require 'parade'
require 'sass/plugin/rack'

use Sass::Plugin::Rack

current_dir = File.expand_path(File.dirname(__FILE__))

# Create each Sinatra app as a class.
(0...12).each do |i|
  klass = Class.new(Parade::Server) do
    set :presentation_directory, "#{current_dir}/d#{i}"
    set :presentation_file, "#{current_dir}/d#{i}/parade"
    register_stylesheet("#{current_dir}/public/stylesheets/default_overrides.css")
  end

  Kernel.const_set "D#{i}".to_sym, klass
end

# Map each Sinatra app to a URL.
maps = (0...12).inject({}) do |result, i|
  result["/d#{i}"] = Kernel.const_get("D#{i}".to_sym).new
  result
end


run Rack::URLMap.new(maps)

require 'parade'
require 'sass/plugin/rack'


use Sass::Plugin::Rack

current_dir = File.expand_path(File.dirname(__FILE__))

# Create each day's Sinatra app as a class.
(1...12).each do |i|
  klass = Class.new(Parade::Server) do
    set :presentation_directory, "#{current_dir}/d#{i}"
    set :presentation_file, "#{current_dir}/d#{i}/parade"
    register_stylesheet("#{current_dir}/public/stylesheets/default_overrides.css")
  end

  Kernel.const_set "D#{i}".to_sym, klass
end

# Map each Sinatra app to a URL.
maps = (1...12).inject({}) do |result, i|
  result["/d#{i}"] = Kernel.const_get("D#{i}".to_sym).new
  result
end

# Create the non-day app classes.
%w[home itinerary].each do |resource|
  klass = Class.new(Parade::Server) do
    set :presentation_directory, "#{current_dir}/#{resource}"
    set :presentation_file, "#{current_dir}/#{resource}/parade"
    register_stylesheet("#{current_dir}/public/stylesheets/default_overrides.css")
  end

  Kernel.const_set "#{resource.capitalize}".to_sym, klass
end

# Map other URLs
%w[home itinerary].inject(maps) do |result, resource|
  url = resource == 'home' ? '/' : "/#{resource}"
  result[url] = Kernel.const_get(resource.to_s.capitalize).new
  result
end

# Run 'em!
run Rack::URLMap.new(maps)

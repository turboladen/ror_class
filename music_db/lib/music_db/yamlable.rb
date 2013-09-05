require 'yaml'


module MusicDB::YAMLable
  def to_yaml
    if self.respond_to? :attributes
      YAML.dump(attributes)
    else
      raise "Hey, #{self.class} needs some attributes!"
    end
  end

  def dump(filename=nil)
    filename ||= 'unknown'

    File.write("#{filename}.yml", to_yaml)
  end
end

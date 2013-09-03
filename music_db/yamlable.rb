require 'yaml'


module YAMLable
  def to_yaml
    YAML.dump(attributes)
  end

  def dump(filename=nil)
    filename ||= 'unknown'

    File.write("#{filename}.yml", to_yaml)
  end
end

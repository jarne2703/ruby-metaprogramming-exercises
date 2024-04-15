# TODO: Write my_attr_reader
# TODO: Write my_attr_writer
# TODO: Write my_attr_accessor, preferably using my_attr_reader and my_attr_writer
class Module
  def my_attr_reader(*args)
    args.each do |arg|
      define_method(arg) do
        instance_variable_get("@#{arg}")
      end
    end
  end

  def my_attr_writer(*args)
    args.each do |arg|
      define_method("#{arg}=") do |value|
        instance_variable_set("@#{arg}", value)
      end
    end
  end

  def my_attr_accessor(*args)
    my_attr_reader(*args)
    my_attr_writer(*args)
  end
end



class Singer
  # TODO: Change to my_attr_writer
  my_attr_writer :first_name
  # TODO: Change to my_attr_reader
  my_attr_reader :last_name
  # TODO: Change to my_attr_acessor
  my_attr_accessor :birth_year, :greatest_hit

  def initialize(first_name, last_name, birth_year, greatest_hit)
    @first_name = first_name
    @last_name = last_name
    @birth_year = birth_year
    @greatest_hit = greatest_hit
  end

  # An example of a getter (or "reader") if we didn't use attr_reader
  def first_name
    @first_name
  end

  # An example of a setter (or "writer") if we didn't use attr_writer
  def last_name=(value)
    @last_name = value
  end

  def to_s
    "#{first_name} #{last_name}, born in #{birth_year}, greatest hit: \"#{greatest_hit}\""
  end
end

sinatra = Singer.new("Nancy", "Sinatra", 1940, "These Boots Are Made for Walkin'")

puts sinatra

sinatra.first_name = "Frank"
sinatra.birth_year = 1915
sinatra.greatest_hit = "My Way"

puts sinatra

class Course
  attr_accessor :title, :institution, :url, :id, :description

  @@course_list = []

  def initialize(course_hash)
    course_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@course_list << self
  end

  def self.all
    @@course_list
  end

  def self.find(index)
    self.all[index]
  end

  def self.find_by_institution(institution)
    self.all.select{|course| course.institution == institution}
  end

  def add_description(course_description)
    self.description = course_description
  end

  def display_description
    puts "#{self.description}"
    puts ""
  end

end

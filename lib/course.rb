class Course
  attr_accessor :title, :institution, :url, :id, :description

  @@course_list = []

  def initialize(course_hash)
    course_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@course_list << self
  end

  def self.create_courses(courses)
    courses.each do |course_hash|
      Course.new(course_hash)
    end
  end

  def self.all
    @@course_list
  end

  def add_description(course_description, selected_course)
    selected_course.description = course_description
  end

  def display_description
    puts "#{self.description}"
    puts ""
  end

end

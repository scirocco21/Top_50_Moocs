class Course
  attr_accessor :title, :institution, :url

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

  def show_course_list
    Course.all.each do |course|
      puts course.title
    end
  end

  def self.all
    @@course_list
  end

end

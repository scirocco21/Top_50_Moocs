class Course
  attr_accessor :title, :description, :url

  @@all = []

  def initialize(courses_hash)
    courses_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
  @@all << self

end

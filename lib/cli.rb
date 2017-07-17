class CLI

  def call
    puts "Welcome to popular_moocs, a list of all Massive Open Online Courses featured as 'popular' on Coursera!"
    puts "Press enter to see the full list."
    make_courses
    show_course_list
    puts "Enter 'return' to go back to the menu or type 'exit' to quit the program."
  end

  def make_courses
    courses = Scraper.scrape_courses
    Course.create_courses(courses)
  end

  def show_course_list
    Course.all.each do |course|
      puts course.title
    end
  end

end

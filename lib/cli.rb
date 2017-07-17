class CLI

  def call
    puts "Welcome to popular_moocs, a list of all Massive Open Online Courses featured as 'popular' on Coursera!"
    puts "Press enter to see the full list."
    if gets == "\n"
      make_courses
      show_course_list
    end
    puts "Enter 'return' to go back to the menu or type 'exit' to quit the program."
    if gets.strip.downcase == "return"
      call
    elsif gets.strip.downcase == "exit"
      exit
    end
  end

  def make_courses
    courses = Scraper.scrape_courses
    Course.create_courses(courses)
  end

  def show_course_list
    list_counter = 1
    Course.all.each do |course|
      puts "#{list_counter}. #{course.title}"
      puts "Course provider: #{course.institution}"
      puts "Link: https://www.coursera.org" + "#{course.url}"
      puts ""
      list_counter += 1
    end
  end

end

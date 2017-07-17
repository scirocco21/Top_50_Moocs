class CLI

  def call
    puts "Welcome to popular_moocs, a list of all Massive Open Online Courses featured as 'popular' on Coursera!"
    puts "Press enter to see the full list."
    if gets == "\n"
      make_courses
      show_course_list
    end
    puts "Please enter a course number to see more details."
    input = gets.strip.to_i

    if input.between?(1,20)
      selected_course = Course.all.find {|course| course.id == input}
      course_description = Scraper.scrape_course_description(selected_course)
      selected_course.add_description(course_description, selected_course)
      selected_course.display_description
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
    Course.all.each do |course|
      puts "#{course.id}. #{course.title}"
      puts "Course provider: #{course.institution}"
      puts "Link: #{course.url}"
      puts ""
    end
  end

end

class CLI

  def call
    puts "Welcome to popular_moocs, a list of all Massive Open Online Courses featured as 'popular' on Coursera!"
    puts "Press enter to see the full list."
    make_course_list
    show_course_list(course_list)
    puts "Enter the course number for more information or type 'exit' to quite the program."
    input = gets.strip.downcase
    show_course_details(input) unless input == "exit"
    puts "Enter 'return' to go back to the menu or type 'exit' to quit the program."
  end

  def make_course_list
    course_list = Scraper.scrape_courses
  end

  def show_course_list(course_list)
    course_list.each {|course| puts course}
  end



end

class CLI

  def call
    puts "Welcome to the Top 50 MOOCs (Massive Open Online Courses)!"
    puts "Please enter 'all' for the full list. To see only one part, enter either '1-24' or '25-50'."
    make_course_list
    show_course_list
    puts "Enter the course number for more information or type 'exit' to quite the program."
    get_info
    show_info
    puts "Enter 'return' to go back to the menu or type 'exit' to quit the program."
  end

  def make_course_list
    course_list = Scraper.scrape_courses
  end


end

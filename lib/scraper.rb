class Scraper

  def self.scrape_courses
    html = open('https://www.coursera.org/featured/trending_courses_locale_en_os_web')
    doc = Nokogiri::HTML(html)
    course_titles = doc.css('b').text
    course_description = doc.css('h3:first')
  end
end

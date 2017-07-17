
class Scraper

  def self.scrape_courses
    courses = []
    html = open('https://www.coursera.org/featured/trending_courses_locale_en_os_web')
    doc = Nokogiri::HTML(html)
    course_cards = doc.css('a.rc-OfferingCard.nostyle')
    course_cards.each do |course|
      course_title = course.css('h2.color-primary-text.headline-1-text.flex-1').text
      course_provider = course.css('div.text-light.offering-partner-names').text
      course_url = course.attribute("href").value
      courses << {title: course_title, institution: course_provider, url: course_url}
    end
    courses
  end

  def self.scrape_course_description(course_url)
    html = open('course_url')
    doc = Nokogiri::HTML(html)
    course_description = doc.css('p.body-1-text.course-description')
  end

end

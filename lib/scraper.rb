require 'open-uri'
require 'pry'

class Scraper

scraper_students = [ ]

  def self.scrape_index_page(index_url)
      doc = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/index.html"))
      
      doc.css(".post").each do |post|
      course = Course.new
      course.title = post.css("h2").text
      course.schedule = post.css(".date").text
      course.description = post.css("p").text
  end

  def self.scrape_profile_page(profile_url)
    
  end

end


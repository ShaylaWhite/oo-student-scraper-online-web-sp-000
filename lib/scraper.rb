require 'open-uri'
require 'pry'

class Scraper

scraper_students = [ ]

  def self.scrape_index_page(index_url)
      doc = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/index.html"))
      
      
  end

  def self.scrape_profile_page(profile_url)
    
  end

end


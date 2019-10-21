require 'open-uri'
require 'pry'

class Scraper

scraper_students = [ ]

  def self.scrape_index_page(index_url)
  	doc = Nokogiri::HTML(open(index_url))
  	students = doc.css("div.student-card")

  	students_array = []
  	
    students.each{|student|
  		students_array.push({
  			:name => student.css("div.card-text-container h4.student-name").text,
  			:location => student.css("div.card-text-container p.student-location").text,
  			:profile_url => index_url + "/" + student.css("a").attribute("href").value
  		})
  	}

  	students_array
  end

  def self.scrape_profile_page(profile_url)
    
  end

end


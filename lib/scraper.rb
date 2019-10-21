require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    index_page = Nokogiri::HTML(open(index_url))
    students = []

    index_page.css('div.roster-cards-container').each do |card|
      card.css('.student-card a').each do |student|
        student_name = student.css('h4.student-name').text
        student_location = student.css('p.student-location').text
        student_profile_link = student.attr('href')
        students << {name: student_name, location: student_location, profile_url: student_profile_link}
      end
    end
    students
  end

   profile_page = Nokogiri::HTML(open(profile_url))
    students = {}
    social = profile_page.css('div.social-icon-container').children.css('a').map{ |icon| icon.attribute('href').value}
    social.each do |link|
      if link.include?('twitter')
        students[:twitter] = link
      elsif link.include?('linkedin')
        students[:linkedin] = link
      elsif link.include?('github')
        students[:github] = link
      else
        students[:blog] = link
      end
    end
end


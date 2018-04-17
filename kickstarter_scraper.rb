require 'nokogiri'
require 'pry'

# projects: kickstarter.css("li.project.grid_4")
# title: project.css("h2.bbcard_name strong a").text
# image link: project.css("div.project-thumbnail a img").attribute("src").valuproject.css("p.bbcard_blurb").text
# description: project.css("p.bbcard_blurb").text
# location: project.css("ul.project-meta span.location-name").text
# percent funded : project.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i
# note: .gsub("%", "").to_i to removes the percent sign and converts it into an integer

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)

  projects = {}

  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      :description => project.css("p.bbcard_blurb").text,
      :location => project.css("ul.project-meta span.location-name").text,
      :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
    }

  end
  projects

  def self.scrape_museums_landing_page
      museums_landing = Nokogiri::HTML(open("https://www.si.edu/museums"))
      #museums = []

      name = museums_landing.css("h3.title").text
      binding.pry

    end

end

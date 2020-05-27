require "nokogiri"
require "httparty"

class Scraper
  def initialize(url)
    html = HTTParty.get(url)
    @page_content = Nokogiri::HTML(html)
  end
end

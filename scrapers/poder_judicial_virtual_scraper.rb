require_relative "scraper"

class PoderJudicialVirtualScraper < Scraper
  def find_actor
    header_data[1].sub!("Actor:", "").strip
  end

  def find_defendant
    header_data[2].sub!("Demandado:", "").strip
  end

  def find_court
    court_data = header_data[0].split("&gt;")
    court_data[1].strip
  end

  def find_expedient_number
    expedient_components = summary_component.css("strong").first.text.split(" ")
    expedient_components.last.strip
  end

  def find_notifications
    summary_component.css("strong").last.text.strip
  end

  def find_summary
    summary_component.text.strip
  end

  private

  def header_data
    @header_data ||= header_components
  end

  def header_components
    plain_html_str = header_component.to_s.sub!("<p>", "").sub!("</p>", "")
    plain_html_str.split("<br>")
  end

  def header_component
    @header_component ||= @page_content.css("#pcont").css(".content").first.css("p")
  end

  def summary_component
    @summary_component ||= @page_content.css("#pcont").css(".content")[1].css("p")
  end
end

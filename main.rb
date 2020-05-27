require "./scrapers/poder_judicial_virtual_scraper"
require "./core/expedient"
require "./db/expedient_collection"

poder_judicial_scrapper = PoderJudicialVirtualScrapper.new("https://www.poderjudicialvirtual.com/mn-banco-santander-mexico-s-a--banco-santander-mexico")
expedient = Expedient.new(poder_judicial_scrapper)

expedient_collection = ExpedientCollection.new
expedient_collection.create_table

expedient_collection.create(expedient.for_database)

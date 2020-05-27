require "./scrapers/poder_judicial_virtual_scraper"

RSpec.describe PoderJudicialVirtualScrapper do
  context "with valid url" do
    it "retrieves the correct info" do
      poder_judicial_scrapper = PoderJudicialVirtualScrapper.new("https://www.poderjudicialvirtual.com/mn-banco-santander-mexico-s-a--banco-santander-mexico")
      expect(poder_judicial_scrapper.find_actor).to eq("Banco Santander México S.a.")
      expect(poder_judicial_scrapper.find_defendant).to eq("Banco Santander Mexico")
      expect(poder_judicial_scrapper.find_court).to eq("Juzgado Segundo Civil")
      expect(poder_judicial_scrapper.find_expedient_number).to eq("1794/2013")
      expect(poder_judicial_scrapper.find_notifications).to eq("3")
      expect(poder_judicial_scrapper.find_summary).to eq("RESUMEN: El Expediente 1794/2013 fue promovido por BANCO SANTANDER MÉXICO S.A. en contra de BANCO SANTANDER MEXICO en el Juzgado Segundo Civil en Morelia, Michoacán. El Proceso inició el 09 de Enero del 2014 y cuenta con 3 Notificaciones.")
    end
  end
end

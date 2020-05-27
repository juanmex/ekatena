# Ekatena

Hacer un servicio/script en ruby que reciba una direccion del sitio https://www.poderjudicialvirtual.com, que extraiga la informacion del juicio (actor, demandado, expediente, notifiaciones, resumen, juzgado, etc) y que guarde la informacion en una base de datos.

## Installation

Install the nokogiri gem for parsing HTML

```bash
gem install nokogiri
```

Install the httparty gem for making http fun again!

```bash
gem install httparty
```

Install the mysql2 gem for database connection
```bash
sudo apt-get install libmysqlclient-dev
```

```bash
gem install mysql2
```

Install the rspec gem for testing the classes
```bash
gem install rspec
```

## Usage

```ruby

require "./scrapers/poder_judicial_virtual_scraper"
require "./core/expedient"
require "./db/expedient_collection"

poder_judicial_scraper = PoderJudicialVirtualScraper.new("https://www.poderjudicialvirtual.com/mn-banco-santander-mexico-s-a--banco-santander-mexico")
expedient = Expedient.new(poder_judicial_scraper)

expedient_collection = ExpedientCollection.new
expedient_collection.create_table

expedient_collection.create(expedient.for_database)

```

Testing the scraper
```bash
rspec spec/poder_judicial_virtual_scraper_spec.rb
```
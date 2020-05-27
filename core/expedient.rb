class Expedient
  def initialize(scrapper)
    @scrapper = scrapper
  end

  def actor
    @actor ||= @scrapper.find_actor
  end

  def defendant
    @defendant ||= @scrapper.find_defendant
  end

  def court
    @court ||= @scrapper.find_court
  end

  def expedient_number
    @expedient_number ||= @scrapper.find_expedient_number
  end

  def notifications
    @notifications ||= @scrapper.find_notifications
  end

  def summary
    @summary ||= @scrapper.find_summary
  end

  def for_database
    {
      :actor => actor,
      :defendant => defendant,
      :court => court,
      :expedient_number => expedient_number,
      :notifications => notifications,
      :summary => summary,
    }
  end
end

require "./db/mysql_record"

class ExpedientCollection < MysqlRecord
  def table
    "expedients"
  end

  def schema
    {
      "id" => "INT AUTO_INCREMENT PRIMARY KEY",
      "actor" => "VARCHAR(255)",
      "defendant" => "VARCHAR(255)",
      "court" => "VARCHAR(255)",
      "expedient_number" => "VARCHAR(255)",
      "notifications" => "INT",
      "summary" => "TEXT",
    }
  end
end

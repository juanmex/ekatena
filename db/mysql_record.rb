require "./db/mysql_database"

class MysqlRecord
  def connection
    MysqlDatabase.connect
  end

  def create(data)
    q = "INSERT INTO #{table} (#{keys_from(data)}) VALUES (#{values_from(data)})"
    connection.query(q)
  end

  def create_table
    connection.query("CREATE TABLE IF NOT EXISTS #{table} (
        #{table_structure_str}
    )  ENGINE=#{MysqlDatabase.engine};")
  end

  private

  def keys_from(data)
    data.keys.map { |column| "#{column}" }.join(",")
  end

  def values_from(data)
    data.values.map { |value| "'#{value}'" }.join(",")
  end

  def table_structure_str
    schema.keys.map { |column| "#{column} #{schema[column]}" }.join(", ")
  end
end

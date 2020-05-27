require "mysql2"
require "yaml"

class MysqlDatabase
  def self.connect
    @conn ||= Mysql2::Client.new(
      host: database_config["host"],
      username: database_config["username"],
      password: database_config["password"],
      database: database_config["database"],
    )
  end

  def self.database_config
    YAML.load(File.read("database.yml"))
  end

  def self.engine
    "INNODB"
  end
end

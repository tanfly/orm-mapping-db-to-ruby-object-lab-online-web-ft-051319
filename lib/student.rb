class Student 
  
  attr_accessor :name, :grade, :id


  def self.create_table
      sql =  <<-SQL 
       CREATE TABLE IF NOT EXISTS students (
         id INTEGER PRIMARY KEY, 
         name TEXT, 
         grade INTEGER
         )
         SQL
     DB[:conn].execute(sql) 
  end
  
  def self.drop_table 
    sql =  <<-SQL 
       DROP TABLE IF EXISTS students 
         SQL
     DB[:conn].execute(sql) 
  end
  
  def save
     sql = <<-SQL
       INSERT INTO students (name, grade) 
       VALUES (?, ?)
     SQL
  
     DB[:conn].execute(sql, self.name, self.grade)
    
     @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
  end
  

  def self.new_from_db(row)
    new_student = self.new 
    new_student.id = row[0]
    new_student.name = row[1]
    new_student.length = row[2]
    new_student
  end
  
  def self.all 
    sql = <<-SQL 
    SELECT * 
    FROM students 
    SQL
    
  DB[:conn].execute(sql).map do |row| 
  self.new_from_db(row)
    end
  end
  
  def self.1.  def self.find_by_name(name)
2.     sql = <<-SQL
3.       SELECT *
4.       FROM songs
5.       WHERE name = ?
6.       LIMIT 1
     SQL
8.  
9.     DB[:conn].execute(sql, name).map do |row|
10.       self.new_from_db(row)
11.     end.first
12.   end
13. end

def self.find_by_name(name)
  sql = <<-SQL 
  SELECT *
  FROM students 
  WHERE name = ? 
  LIMIT 1 
  SQL

  
 

  
  
end
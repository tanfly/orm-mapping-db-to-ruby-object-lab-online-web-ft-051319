class Student 
  
  attr_accessor :name, :grade
  attr_reader :id


  def initialize (name, grade, id = nil)
    @name = name 
    @grade = grade 
    @id = id
  end 


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
  
  def self.create(name:, grade:)
    student = Student.new(name, grade)
    student.save
    student
  end
  
  1. def self.new_from_db(row)
2.   new_song = self.new  # self.new is the same as running Song.new
3.   new_song.id = row[0]
4.   new_song.name =  row[1]
5.   new_song.length = row[2]
6.   new_song  # return the newly created instance
7. end

def self.new_from_db(row)
  new_student = self.new 
  new_student.id = row[0]
  new_student.name = row[1]
  new_student.length = row[2]
  new_student
  

  
  
end
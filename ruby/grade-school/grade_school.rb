module BookKeeping
  VERSION = 3
end

class School
  def initialize
    @roster = Hash.new { [] } 
  end

  def students(grade)
    @roster[grade]
  end

  def add(name, grade)
    @roster[grade] = (@roster[grade] << name).sort
  end

  def students_by_grade
    @roster.keys.sort.reduce([]) { |memo, grade| 
      memo << {
        grade: grade,
        students: students(grade)
      }
    }
  end
end

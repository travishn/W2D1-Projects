class Employee
  attr_reader :name, :title, :salary, :boss
  
  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end
  
  def boss=(name)
    @boss = name
    name.add_employee(self) unless boss.nil?
  end
  
  def bonus(multiplier)
    salary * multiplier
  end
end

class Manager < Employee
  attr_reader :employees
  
  def initialize(name, title, salary)
    @employees = []
    super(name, title, salary, boss)
  end
  
  def add_employee(name)
    @employees << name
  end
  
  def boss=(name)
    super(name)
    
    employees.each do |employee|
      name.add_employee(employee)
    end
    
    name.name
  end
  
  private
  def bonus(multiplier)
    employee_salary = employees.map(&:salary).inject(:+)
    employee_salary * multiplier
  end
end

  
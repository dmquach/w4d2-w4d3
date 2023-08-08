class Employee
    attr_reader :salary
    def initialize(name, title, salary, boss)
        @name, @title, @salary, @boss = name, title, salary, boss
        @boss.subordinates << self if !boss.nil?
    end

    def bonus(multiplier)
        bonus = @salary * multiplier
    end

end

class Manager < Employee
    attr_reader :subordinates
    def initialize(name, title, salary, boss = nil)
        super
        @subordinates = []
    end

    def bonus(multiplier)
        return self.salary if self.class == Employee
        sum = 0
        subordinates.each do |emp|
            sum += emp.salary + emp.bonus(1) if emp.class == Manager
        end
        sum * multiplier
    end
end

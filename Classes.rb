class Classes
    attr_accessor :name_class,:skill,:mod
    def initialize name_class,skill,mod={}
        @name_class=name_class
        @skill=skill
        @mod=mod
    end
    # def << player
    #     return self
    # end

    def to_s
        "Class: #{@name_class} - Skill: #{@skill} - Modifier: #{@mod}"
    end
end
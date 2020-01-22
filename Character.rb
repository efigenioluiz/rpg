class Race 
    attr_accessor :name,:life,:atk,:defe,:int,:force
    def initialize name, life, atk, defe, int,force 
        @name=name
        @life=life
        @atk=atk
        @defe=defe
        @int=int
        @force=force
    end
end

class Character 
    attr_accessor :name_character,:age,:race,:classes,:level
    def initialize name_character, age, race
        @name_character=name_character
        @age=age
        @race=race
        @life= race.life
        @atk=race.atk
        @defe=race.defe
        @int=race.int
        @force=race.force
        @classes=[] 
        #Testar para treinamento
        #@exp=0
        @level=1

        def << classe
            @classes << classe
            @life += classe.mod[:life].to_i
            @atk += classe.mod[:atk].to_i
            @defe += classe.mod[:defe].to_i
            @int += classe.mod[:int].to_i
            @force += classe.mod[:force].to_i
        end
    end
    
    
    def to_s
        "\033[0;34mName: #{@name_character}\n\033[0;0m\033[0;37mAge: #{@age} \033[0;31m\nLife: #{@life}\033[0;0m\033[0;33m \nAtk: #{@atk} \033[0;0m\033[0;34m\nDef: #{@defe} \033[0;0m\033[0;32m\nInt: #{@int} \033[0;0m\033[0;33m\nFor:#{@force} \033[0;0m\033[0;36m\nRace: #{@race.name}\033[0m\n#{@classes}"
    end
end

class Human < Race
    def initialize
        super "Human",20,8,8,10,10
        # @life=20
        # @atk=8
        # @defe=8
        # @int=10
        # @force=10
    end
end

class Elf < Race
    def initialize
        super "Elf",25,5,6,20,10
        # @life=25
        # @atk=5
        # @defe=6
        # @int=20
        # @force=10
    end
end

class Dwarf < Race
    def initialize
        super "Dwarf",18,9,11,7,20
        # @life=18
        # @atk=9
        # @defe=11
        # @int=7
        # @force=20        
    end
end

class Orc < Race
    def initialize
        super "Orc",15,12,5,2,25
        # @life=15
        # @atk=12
        # @defe=5
        # @int=2
        # @force=25        
    end
end

# Abobinação de código sai daqui!

# def adjustment_attribute player, classes
    
#     player.life+=classes.mod[:life].to_i
#     player.atk+=classes.mod[:atk].to_i
#     player.defe+=classes.mod[:defe].to_i
#     player.int+=classes.mod[:int].to_i
#     player.force+=classes.mod[:force].to_i
#     player.classes=classes
    
#     player
# end

# def add_class player, classe
#     aux=[]
#     aux2=[]
    
#     aux=player.classes
#     aux2<<aux<<classe
#     aux2 
# end
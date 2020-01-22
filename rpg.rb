require './Character'
require './Classes'
# require File.expand_path(File.join(File.dirname(__FILE__), 'Character'))

def return_race race_id 
    if race_id ==1 
        Human.new
    elsif race_id ==2
        Elf.new
    elsif race_id ==3
        Dwarf.new
    elsif race_id == 4
        Orc.new
    end
end

def main
    
    all_player=[]
    all_class=[]
    
    all_class.push Classes.new 'Builders','To Build a House',{force: 1, int: 1, life: -2}
    all_class.push Classes.new 'Forger','Build Sword and Armor',{force: 2, atk: 1}
    all_class.push Classes.new 'Healer','Cure Other Units',{defe: 3, atk: -1, int: 3}
    all_class.push Classes.new 'Warrior','Attack, Defend',{defe: 2, atk: 3, force: 2}
    
    while 1>0
        system("clear")
        puts "RPG- WELCOME TO TAVERN TADS"
        puts "1-Create Character"
        puts "2-train Character"
        puts "3-Create Class"
        puts "4-Search by Race"
        puts "5-Search by Class"
        puts "6-Leaving the Tavern"
        puts "\nChoose Option:"
        op=gets.strip.to_i
        
        if op ==1
            puts 'Type your Nickname'
            name=gets.strip.to_s
            puts 'Type your Age'
            age=gets.strip.to_i
            system 'clear'
            puts "CHOOSE YOUR RACE!"
            puts "1-Human"
            puts "2-Elf"
            puts "3-Dwarf"
            puts "4-Orc"
            race= return_race gets.strip.to_i
    
            system 'clear'
            puts "CHOOSE YOUR CLASS!"

            all_class.each_with_index do | classe, a|
                puts "#{a}-#{classe}"
            end
            
            class_id=gets.strip.to_i
            
            system('clear')
            
            player=Character.new name,age,race
            player << all_class[class_id]
            puts player
            all_player.push player
            # puts all_player.inspect
            puts "\033[0;32msuccessfully created character\nPress Enter\033[0;0m"
            gets
            
        elsif op ==2
            if all_player.empty?
                puts "No registered players\nPress Enter!"
                gets
            else 
                puts "CHOOSE A CHARACTER!"
                all_player.each_with_index do |player,a| 
                    puts "ID:#{a}\n#{player}"
                    puts "****************************"
                end
                puts "ID?:"
                player_id=gets.strip.to_i
                system('clear')
                puts "Nome:#{all_player[player_id].name_character}"
                for a in 1..6
                    sleep(1)
                    if a== 1
                        print "Training"
                    else
                        print "."
                    end
                end
                puts "\nTraining Completed"
                all_player[player_id].level+=1
                puts "LEVEL UP!! LVL#{all_player[player_id].level}"
                puts "CHOOSE OTHER CLASS!"
                all_class.each_with_index do | classe, a|
                    puts "#{a}-#{classe}"
                end
                class_id=gets.strip.to_i

                all_player[player_id]<< all_class[class_id]
            end
        elsif op ==3
            puts 'Type your Class Name'
            name_class=gets.strip.to_s
            
            puts 'Type your Skill'
            skill=gets.strip.to_s
            
            puts 'Type your Life'
            life=gets.strip.to_i
            
            puts 'Type your Attack'
            atk=gets.strip.to_i
            
            puts 'Type your Defense'
            defe=gets.strip.to_i
            
            puts 'Type your intelligence'
            int=gets.strip.to_i
            
            puts 'Type your Force'
            force=gets.strip.to_i
            
            mod={}
            mod={life: life, atk: atk, defe: defe, int: int, force: force}
            classe= Classes.new name_class,skill,mod
            
            all_class.push classe
            puts classe
            
            gets
        
        elsif op == 4
            if all_player.empty?
                puts "No registered players\nPress Enter!"
            else
                system('clear')
                puts "SEARCH BY RACE"
                puts "1-Human"
                puts "2-Elf"
                puts "3-Dwarf"
                puts "4-Orc"
                search_race = return_race gets.strip.to_i

                all_player.each do |player| 
                    if player.race.name == search_race.name
                        puts player
                    end
                end
                puts 'Press Enter!'
            end
            gets
        elsif op == 5
            if all_player.empty?
                puts "No registered players\nPress Enter!"
            else
                system('clear')
                puts "SEARCH BY CLASS"
                all_class.each_with_index do | classe, a|
                    puts "#{a}-#{classe}"
                end
                search_class= gets.strip.to_i


                all_player.each do |player| 
                    player.classes.each do |classe|    
                        if classe.name_class == all_class[search_class].name_class
                            puts player
                        end
                    
                    #puts player
                    end
                end

                puts 'Press Enter!'
            end
            gets
        elsif op == 6
            break
        else 
            puts "Invalid Option, Try Again"
        end            
        #sleep(1)                                                                                                      
    end
end
main
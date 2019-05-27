require 'pry'

##### Backup of holiday.rb before I started cleaning it


holiday_hash = 
  {
    :winter => {
      :christmas => ["Lights", "Wreath"],
      :new_years => ["Party Hats"]
    },
    :summer => {
      :fourth_of_july => ["Fireworks", "BBQ"]
    },
    :fall => {
      :thanksgiving => ["Turkey"]
    },
    :spring => {
      :memorial_day => ["BBQ"]
    }
  }

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
holiday_hash[:summer][:fourth_of_july][1]

end



def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply
end



def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
holiday_hash[:spring][:memorial_day] << supply

end




def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
# holiday_hash[:season][:holiday_name] = {supply_array} # unexpected '}', expecting =>
#...:holiday_name] = {supply_array}
# we are adding the holiday to season which is under holiday_hash

# holiday_hash[:season][:holiday_name] = supply_array   # was [supply_array]
# maybe can't use symbol syntax? 
# holiday_hash["season"]["holiday_name"] = {supply_array}    # was  supply_array. // {supply_array} doesnt compile
# holiday_hash["season"]["holiday_name"] = [supply_array]  #   undefined method `[]=' for nil:NilClass
# holiday_hash[:season][:holiday_name] = supply_array   #   undefined method `[]=' for nil:NilClass
# maybe need to create the key first? 
# holiday_hash[:season] = {:holiday_name => supply_array}
holiday_hash[season][holiday_name] = supply_array #maybe need to exclude : 

holiday_hash
end





def all_winter_holiday_supplies(holiday_hash)
holding_array=[]

#Supply is: TestTrue["Lights", "Wreath"]["Party Hats"]TestTestTest[[["Lights", "Wreath"], ["Party Hats"]], nil, nil, nil]

  holiday_hash.find do |season, holiday|     # returns : Supply is: [nil, nil, nil, nil]
    print "Test"
    if season == :winter      # was ==:holiday... winter is not a holiday... 
      puts "True"
      holiday.collect do |occasion_name, supply|  
        puts "   Printing supply in holiday.collect :"
        print supply
        #supply.collect do |supply_array_element|
          #supply_array_element
          #holding_array << supply_array_element
          # supply    # Returns:   [ :winter, { :christmas=>["Lights", "Wreath"],   :new_years=>["Party Hats"]  } ]
          #holiday_hash[:season][:holiday]supply[0]   #NOPE, defeats using collect. 
        #end
            supply.collect do |supply_array_element|
              puts "   Printing supply_array_element in supply.collect :"
              print supply_array_element
              holding_array << supply_array_element         
            end            
      end
    end
  end

holding_array

end




def my_titleize (input_string)
  i = 0
  words = input_string.gsub!("_", " ")

  words = input_string.split    # Outputs an array of words
  words.each do |word|
    if ( (words[i][0] == words[i][0].capitalize) && (words[i][1] == words[i][1].capitalize) ) #assume abbrev.
      break
    end
    words[i] = word.capitalize
    i +=1
  end
  words = words.join(" ")

  return words.chomp(" ")
end




def all_supplies_in_holidays(holiday_hash)

  output_string = ""
  counter = 0
  holiday_hash.each do |season, holiday|
    output_string << ( ( (my_titleize("#{season.capitalize}")) + ":" ) )  
    output_string << "\n"
    holiday.each do |holiday, supply|  
      output_string <<   ("  " + (my_titleize("  #{holiday.capitalize}") ) + ": ")
      if counter < ((supply.length) -1) ;
        output_string << ("#{my_titleize(supply[counter])}, ")
        counter += 1; 
      end
      if counter == ((supply.length) - 1);    
        output_string += ("#{my_titleize(supply[counter])}\n")
        counter += 1;
#       counter = 0    # reset counter so it will print supplies for all holidays 
      end 
      counter = 0
    end
  end
  puts output_string
end



print all_supplies_in_holidays(holiday_hash)




# def all_supplies_in_holidays(holiday_hash)
  
#   counter = 0
#   holiday_hash.each do |season, holiday|
#     puts "#{season.capitalize}:"
#     holiday.each do |holiday, supply|  
#       print "   #{holiday.capitalize}: "
#       if counter < ((supply.length) -1) ;
#         print "#{my_titleize(supply[counter])}, "
#         counter += 1; 
#       end
#       if counter == ((supply.length) - 1);    
#         print "#{my_titleize(supply[counter])}\n"
#         counter += 1;
#        counter = 0    # reset counter so it will print supplies for all holidays 
#       end 
#     end
#   end
# end



def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_days = []

  # holiday_hash.each do |season, holiday|
  #   holiday.each do |festivo, supply|
  #     if holiday.keys.include?("BBQ")
  #       bbq_days.push(festivo)    #was BBQ_days... caps = constant.. 
  #     end
  #   end
  # end

  # holiday_hash.each do |season, holiday|    # returns empty array []
  #     #if holiday.keys.include?("BBQ")      #BBQ is a value, and array data struct, not a key. 
  #     if holiday.values.include?("BBQ")
  #       bbq_days.push(holiday)   
  #     end
  # end

  holiday_hash.each do |seasons, holiday|
    holiday.each do |occasion, supplies|
      if supplies.include?("BBQ")

        bbq_days.push(occasion)    
      end
    end
  end


  bbq_days

end

puts
print"BBQ Holidays are:"
print(all_holidays_with_bbq(holiday_hash) )




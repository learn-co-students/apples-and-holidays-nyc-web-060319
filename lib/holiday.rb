require 'pry'





def second_supply_for_fourth_of_july(holiday_hash)
  #   # return the second element in the 4th of July array
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

holiday_hash[season][holiday_name] = supply_array # arguments passed in will be :symbols ! 

holiday_hash
end





def all_winter_holiday_supplies(holiday_hash)
holding_array=[]


  holiday_hash.find do |season, holiday|   
    if season == :winter  
      holiday.collect do |occasion_name, supply|  
            supply.collect do |supply_array_element|
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
      end 
      counter = 0   # reset counter so it will print supplies for all holidays 
    end
  end
  puts output_string
end





def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_days = []

  holiday_hash.each do |seasons, holiday|
    holiday.each do |occasion, supplies|
      if supplies.include?("BBQ")

        bbq_days.push(occasion)    
      end
    end
  end

  bbq_days

end






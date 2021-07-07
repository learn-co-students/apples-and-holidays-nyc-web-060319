require 'pry'

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


def add_supply_to_winter_holidays(hash, supply)
  
  hash.each do |season, holiday|
    if season == :winter
      holiday.each do |date, items|
        items << supply
      end
    end
  end

end


def add_supply_to_memorial_day(holiday_hash, supply)
    holiday_hash[:spring][:memorial_day] << supply
    # hash.each do |season, holiday|
    #   if season == :spring
    #     holiday.each do |date, items|
    #       items << supply
    #     end
    #   end
    # end
  end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season] = {holiday_name => supply_array}
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season

  winter_supplies  =  holiday_hash[:winter].collect do |holiday, supply|
      supply
    end

winter_supplies.flatten

end


def all_supplies_in_holidays(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash.each do |season, holiday_list|
    puts "#{season.to_s.capitalize!}:"
    
    holiday_list.each do |event, supply_list|
        if event.to_s.include?("_")
          cap_multi_word = event.to_s.split("_").each do |word|
            word.capitalize!
          end
          puts "  #{cap_multi_word.join(" ")}: #{supply_list.join(", ")}"
        else
          puts "  #{event.to_s.capitalize!}: #{supply_list.join(", ")}"
        end
    end
  end
end
  


def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_arr = []
  thing = holiday_hash.each do |season, holiday_list|
    # p season
    # p holiday_list
    holiday_list.each do |holiday, supply_list|
      # p supply_list
      if supply_list.include?("BBQ")
        bbq_arr << holiday
      end
    end
  end
  bbq_arr
end


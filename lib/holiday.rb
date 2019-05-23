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
  holiday_hash[season] = { holiday_name => supply_array }
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  all_supplies_in_winter = []
  holiday_hash[:winter].keys.each do |winter_holiday|
    holiday_hash[:winter][winter_holiday].each do |supply|
      all_supplies_in_winter << supply
    end
  end
  all_supplies_in_winter
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.keys.each do |season|
    season_str = "#{season}:"
    puts season_str.capitalize!
    holiday_hash[season].keys.each do |each_holiday|
      each_holiday_str = "#{each_holiday}"
      while each_holiday_str.include?("_") do
        each_holiday_str = each_holiday_str.sub("_", " ")
      end
      #each_holiday_str = each_holiday_str.capitalize!
      each_holiday_strs = each_holiday_str.split
      each_holiday_str = ""
      each_holiday_strs.each do |str|
        each_holiday_str += (str.capitalize! == nil ? str : str.capitalize)
        each_holiday_str += " "
      end
      each_holiday_str = each_holiday_str[0..-2]
      holiday_str = "  #{each_holiday_str}:"
      holiday_hash[season][each_holiday].each do |supply|
        holiday_str += " "
        holiday_str += supply
        holiday_str += ","
      end
      holiday_str = holiday_str[0..-2]
      puts holiday_str
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holidays_with_bbq = []
  holiday_hash.keys.each do |season|
    holiday_hash[season].keys.each do |holiday|
      if holiday_hash[season][holiday].include?("BBQ")
        holidays_with_bbq << holiday
      end
    end
  end
  holidays_with_bbq
end








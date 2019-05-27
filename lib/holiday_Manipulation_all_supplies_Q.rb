#### LEARNING NOTES ####

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



def all_supplies_in_holidays(holiday_hash)


  counter = 0
  holiday_hash.each do |season, holiday|
    puts "#{season.capitalize}:"
    holiday.each do |holiday, supply|    #was occasion, not holiday.   undefined method `capitalize' for ["Lights", "Wreath"]:Array
      print "   #{holiday.capitalize}: "
      # supply.each do |supply|

      if counter < ((supply.length) -1) ;
        print "#{supply[counter].capitalize}, "
        counter += 1; 
      end
      if counter == ((supply.length) - 1);  	# had:  if counter = supply.l. Ie. Assignment, not comparison!! 
        print "#{supply[counter].capitalize}\n"
        counter += 1;
       counter = 0 		# reset counter so it will print supplies for all holidays 
      end # need an end for each if? 
    #end
    end
  end

     
  #    NoMethodError:
  #      undefined method `capitalize' for ["Lights", "Wreath"]:Array

end



def my_titleize (input_string)
	i = 0
	words = input_string.gsub!("_", " ")

	words = input_string.split 		# Outputs an array of words
	words.each do |word|
		print "The word I'm at is: "
		puts word
		words[i] = word.capitalize
		i +=1
	end
	words = words.join(" ")

	# while i < words.count
	# 	words[0] = words[0].capitalize
	# 	i +=1
	# end
	# words.join 

	#output_string["_"] = " "		#Only replaces the first _ 
	# output_string.each_char do |char|
	# 	if char == "_"
	# 		puts "We have a __winner"
	# 		char = " "
	# 	end
	# end

	return words.chomp(" ")
end


my_test_string = "Fourth_of_july: fffireworks, bbbbq"
puts all_supplies_in_holidays(holiday_hash)

puts my_titleize(my_test_string)


"hello\nworld".each_char {|s| p s}

"goodnight\nmoon, __ocean"



# BACKUP: 
  # counter = 0
  # holiday_hash.each do |season, holiday|
  #   puts "#{season.capitalize}:"
  #   holiday.each do |holiday, supply|    #was occasion, not holiday.   undefined method `capitalize' for ["Lights", "Wreath"]:Array
  #     print "   #{holiday.capitalize}: "
  #     # supply.each do |supply|

  #     if counter < ((supply.length) -1) ;
  #       print "#{supply[counter].capitalize}, "
  #       counter += 1; 
  #     end
  #     if counter == ((supply.length) - 1);  	# had:  if counter = supply.l. Ie. Assignment, not comparison!! 
  #       print "#{supply[counter].capitalize}\n"
  #       counter += 1;
  #      counter = 0 		# reset counter so it will print supplies for all holidays 
  #     end # need an end for each if? 
  #   #end
  #   end
  # end


######## BACKUP, prior versions of   all_winter_holiday_supplies : 

#   def all_winter_holiday_supplies(holiday_hash)
#   # return an array of all of the supplies that are used in the winter season
# #   holiday_hash[:winter].collect do |holiday, supply|
# #     supply
# #   end
# # end

#   # holiday_hash.collect do |season, holiday|
#   #   season.collect do |season, supply|    #   undefined method `collect' for :winter:Symbol   
#   #     supply
#   #   end
#   # end
#   # print "Supply is: "   # printed: [[["Lights", "Wreath"], ["Party Hats"]], [["Fireworks", "BBQ"]], [["Turkey"]], [["BBQ"]]]
#   #                     # ie. 3 level deep array of all holidays' supplies

#   # holiday_hash.collect do |season, holiday|
#   #   if holiday == :winter
#   #     holiday.collect do |occasion_name, supply|  
#   #       # do I need to add some kind of conditional for #collect? 
#   #       supply      #Supply is: [nil, nil, nil, nil]
#   #     end      
#   #   end
#   # end


#   # holiday_hash.collect do |season, holiday|     # returns : Supply is: [nil, nil, nil, nil]
#   #   if holiday == :winter
#   #     holiday.collect do |occasion_name, supply|  
#   #       i = 0
#   #       while i < supply.length
#   #         print "Supply[i] is (in all_winter_supplies) : " 
#   #         print supply[i]
#   #       supply[i]         # Not sure this will "collect" supply[i] like I am hoping
#   #       i += 1            # Not sure if collecting supply[i] breaks the loop
#   #     end
#   #     end 
#   #   end
#   # end





#   # holiday_hash.collect do |season, holiday|     # returns : Supply is: [nil, nil, nil, nil]
#   #   if holiday == :winter
#   #     holiday.collect do |occasion_name, supply|  
#   #       supply.collect do |supply_array_element|
#   #         supply_array_element
#   #       end
#   #     end 
#   #   end
#   # end


# holding_array=[]

# #Supply is: TestTrue["Lights", "Wreath"]["Party Hats"]TestTestTest[[["Lights", "Wreath"], ["Party Hats"]], nil, nil, nil]

#   holiday_hash.find do |season, holiday|     # returns : Supply is: [nil, nil, nil, nil]
#     print "Test"
#     if season == :winter      # was ==:holiday... winter is not a holiday... 
#       puts "True"
#       holiday.collect do |occasion_name, supply|  
#         puts "   Printing supply in holiday.collect :"
#         print supply
#         #supply.collect do |supply_array_element|
#           #supply_array_element
#           #holding_array << supply_array_element
#           # supply    # Returns:   [ :winter, { :christmas=>["Lights", "Wreath"],   :new_years=>["Party Hats"]  } ]
#           #holiday_hash[:season][:holiday]supply[0]   #NOPE, defeats using collect. 
#         #end
#             supply.collect do |supply_array_element|
#               puts "   Printing supply_array_element in supply.collect :"
#               print supply_array_element
#               holding_array << supply_array_element         
#             end            
#       end
#     end
#   end

# holding_array

# end

# print "Supply is: " 
# print(all_winter_holiday_supplies(holiday_hash) )



# def all_supplies_in_holidays(holiday_hash)
#   # iterate through holiday_hash and print items such that your readout resembles:
#   # Winter:
#   #   Christmas: Lights, Wreath
#   #   New Years: Party Hats
#   # Summer:
#   #   Fourth Of July: Fireworks, BBQ
#   # etc.


#   # holiday_hash.each do |season, holiday|
#   #   puts "#{season.capitalize}:"
#   #   holiday.each do |holiday, supply|    #was occasion, not holiday.   undefined method `capitalize' for ["Lights", "Wreath"]:Array
#   #     puts "#{holiday.capitalize}: #{supply.capitalize}"
#   #   end
#   # end


#   # holiday_hash.each do |season, holiday|
#   #   puts "#{season.capitalize}:"
#   #   holiday.each do |holiday, supply|    #was occasion, not holiday.   undefined method `capitalize' for ["Lights", "Wreath"]:Array
#   #     puts "#{holiday.capitalize}:"
#   #     supply.each do |supply|
#   #       print" #{supply.capitalize}"
#   #     end
#   #   end
#   # end
#   #    Failure/Error: puts "#{holiday.capitalize}: #{supply.capitalize}"
     
#   #    NoMethodError:
#   #      undefined method `capitalize' for ["Lights", "Wreath"]:Array




#   # holiday_hash.each do |season, holiday|
#   #   puts "#{season}.capitalize:"
#   #   holiday.each do |holiday, supply|    #was occasion, not holiday.   undefined method `capitalize' for ["Lights", "Wreath"]:Array
#   #     puts "#{holiday}.capitalize:"
#   #     supply.each do |supply|
#   #       print" #{supply}.capitalize"
#   #     end
#   #   end
#   # end

#   #      #<IO:<STDOUT>> received :puts with unexpected arguments
#   #        expected: ("Winter:")
#   #             got: ("winter.capitalize:")



#   # holiday_hash.each do |season, holiday|
#   #   puts season.capitalize + ":"    #  undefined method `+' for :Winter:Symbol
#   #   holiday.each do |holiday, supply|     
#   #     puts holiday.capitalize + ":"
#   #     supply.each do |supply|
#   #       print supply.capitalize
#   #     end
#   #   end
#   # end



#   counter = 0
#   holiday_hash.each do |season, holiday|
#     puts "#{season.capitalize}:"
#     holiday.each do |holiday, supply|    #was occasion, not holiday.   undefined method `capitalize' for ["Lights", "Wreath"]:Array
#       puts "#{holiday.capitalize}: "
#       # supply.each do |supply|

#       if counter < (supply.length -1) ;
#         print "#{supply[counter].capitalize},"
#         counter += 1; 
#       if counter = (supply.length - 1);  
#         print "#{supply[counter].capitalize}"
#         counter += 1;
        
#       end # need an end for each if? 
#     end
#     end
#   end
# end
# end

     
#   #    NoMethodError:
#   #      undefined method `capitalize' for ["Lights", "Wreath"]:Array

# #maybe try using #flatten for this? can flatten take 
# # OHH they want formatted. 
#          # expected: ("Winter:")
#          #      got: ("winter")




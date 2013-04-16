#occurance
# there are two lists, at least one list is unique
# take the list that could be unique or non-unique
# some of the entries are similar to those in the unique list
# for example the entires have different order or has a comma
# find the top 3 matches for all of the entries in the unique list
# to be more specific
# say in the unique list you had an entry of 
# ebb flowgo
 
# in the non-unique list you had one of
# ebb goflow
# flowgo, ebb
# ebbgoflow
 
# these should match
 
# caveats
#  what happens when two are similar?
#   a full word should matter more than a string, how do you manage that?
 
# all of these are similar and should show up as close matches
 
# set up two arrays, loop through
 
# opportunities
  # soundex (consider how things sound (jeffery and geoffry))
    #https://github.com/waltjones/soundex_find
 
 
# Steps to getting this solved
# the end is the iteration between strings, the first is getting the correct 
 

# setup array to the following format
  # [ [ rw, value, value.order_downcase, {JaroWinkler.object} ]]
    # the unique array should have the JaroWinkler object in it
 
# [order downcase] - put the strings into comparable order
# [ goodmatch? ] - compares two strings
 

require 'pry'
require 'rubygems'
require 'scorer'
require 'amatch'
require 'parallel'
require 'win32ole'
 
include Amatch
 


#old methods
def goodmatch?(check_string,base_string) # measure how good a match is
  base_string.match(check_string.order_downcase)
end

def setsheet(sheetname) #create an instance variable for a sheet
  excel = WIN32OLE::connect('excel.Application')
  worksheet = nil
  excel.Workbooks.each{|wb| 
  wb.Worksheets.each{|ws| 
  if ws.name == sheetname
  worksheet = ws
  return ws
  break
  end
  }
  break unless worksheet.nil?
  }
end


class String
  def order_downcase #alphabetically order the letters in a string, downcase all of those letters
    self.chars.sort_by(&:downcase).join.downcase
  end
end


def arraysetup(startrw, endrw, col, sheet, array, need_jaro=nil)
 #setup an array, [[ rw, name, downcase_name, jaroWinkler object ], [...], [nth array] ]
  
  (startrw..endrw).each do |rw|
    tempvalue = (sheet.Cells(rw,col).value.to_s).order_downcase
    temparray = []
    temparray << rw 
    temparray << sheet.Cells(rw,col).value
    temparray << tempvalue
    if need_jaro == true
      temparray << JaroWinkler.new(tempvalue)
    end
    array << temparray
  end

  return array
end


def match_and_order(value, z)
  #compare the value
  y = z.map &:dup
  y.each do |x|
    x.push value.match(x[2])
  end
  y = y.sort_by{|k|k[3]}.reverse!
  return y
end
 
 
## should be able to say, loop through this array, return the top 3 or something

def fillsheet(sheetvar, rw, colstart, compare_array)
  sheetvar.Cells(rw,colstart).value = compare_array[0][3]
  sheetvar.Cells(rw,(colstart += 1)).value = compare_array[1][3]
  sheetvar.Cells(rw,(colstart += 1)).value = compare_array[2][3]

  sheetvar.Cells(rw,(colstart += 1)).value = compare_array[0][0]
  sheetvar.Cells(rw,(colstart += 1)).value = compare_array[1][0]
  sheetvar.Cells(rw,(colstart += 1)).value = compare_array[2][0]

  sheetvar.Cells(rw,(colstart += 1)).value = compare_array[0][1]
  sheetvar.Cells(rw,(colstart += 1)).value = compare_array[1][1]
  sheetvar.Cells(rw,(colstart += 1)).value = compare_array[2][1]

end

##### Actually running the program
## setup sheets in instance variables
@wsone = setsheet("one")
@wstwo = setsheet("two")


arry1 = []
arry2 = []

arry1 = arraysetup(2,237,1,@wsone, arry1, true)
arry2 = arraysetup(2,153,1,@wstwo, arry2)

# now have two arrays, need to compare them and then put the comparisions in the excel sheet

# t = %w(one two three)
# Parallel.each(t) { |x| puts x}






#Parallel.each_with_index(arry1, :in_threads => 2) do |array, index|
arry1.each_with_index do |array, index|
  ordered_array = match_and_order(array[3], arry2)
  fillsheet(@wsone, array[0], 3, ordered_array)
end

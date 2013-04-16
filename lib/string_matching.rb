require 'rubygems'
require 'scorer'
require 'amatch'
require 'parallel'
require 'win32ole'
include Amatch
 
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


@wsone = setsheet("one")
@wstwo = setsheet("two")

arry1 = []
arry2 = []

#ARGV is placed in the arrays
puts "...Setting up Array 1, using information from tab 'one' from rows 2 - #{ARGV[0]}"
arry1 = arraysetup(2,ARGV[0].to_i,1,@wsone, arry1, true)

puts "...Setting up Array 2, using information from tab 'tab' from rows 2 - #{ARGV[1]}"
arry2 = arraysetup(2,ARGV[1].to_i,1,@wstwo, arry2)


#Parallel.each_with_index(arry1, :in_threads => 2) do |array, index|
arry1.each_with_index do |array, index|
  ordered_array = match_and_order(array[3], arry2)
  fillsheet(@wsone, array[0], 3, ordered_array)
end

puts "Have filled in tab 'one' with the string matching results"


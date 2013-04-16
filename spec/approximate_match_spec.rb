#require File.dirname(__FILE__) + '/xlnalysis/xls'

require File.expand_path('../../approximate_match.rb', __FILE__)
 
describe String, "#order_downcase" do
  it "returns an alphabetically ordered and downcase version of a string" do
    string = "this"
    string.order_downcase.should eq("hist")
  end
end
 
describe "match percentage" do
  it "should be a perfect match" do 
    string1 = "cool"
    string2 = "looc"
    string1 = string1.order_downcase
    string2 = string2.order_downcase
    string1.should eq("cloo")
    string2.should eq("cloo")
    jaro = JaroWinkler.new(string1)
    goodmatch?(string2, jaro).should eq(1)
  end
end


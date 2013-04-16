![Image Alt](https://github.com/ebbflowgo/string_matching/blob/master/images/string_matching.png?raw=true)
===============

##### A quick and dirty way to find the similarity between two strings. Please fork it and send a pull request over if you would like to upgrade it.


![Image Alt](https://github.com/ebbflowgo/string_matching/blob/master/images/Output_Example.PNG?raw=true)

### About

Say you have two lists. List 1 and List 2. You have been asked to check if each word in List 1 exists in List 2. Using a program such as Excel, you would use the VLOOKUP function or something similar to check if each word were in the other list. 

It gets interesting when the names are *similar but not the exact same*. For example, what if one name was "Lastname, Firstname" and the other one was "FIRSTNAME LASTNAME"? You could do some string manipulation and do a VLOOKUP, and then you find that you also have these names:

```
Lastname, Firstname
Lastname, Middle Initial Firstname
Firstname Lastname, Middle Initial
Lastname Firstname
```

For this situation it is useful to use something like the [JaroWinkler](http://en.wikipedia.org/wiki/Jaro%E2%80%93Winkler_distance) distance to measure the similarity between two strings. 

### Run

The two numbers after the file name are the number of rows in column A in tabs "one" and "two", respectively. 

```ruby
ruby string_matching.rb 10 4235
```


### Setup

1. Install [Ruby - Windows](http://rubyinstaller.org/)  or the Mac alternative
2. Setup rubygems, gem install [scorer, amatch, parallel]
3. Open an excel sheet, name one tab "one" and another "two"
4. Put your benchmark words, the worsts you would like to find, in Column A of tab "one"
5. In Column A of tab "two", put the words that you would like to compare against 
6. Clone the code into a database that you know of.
7. Run the string_matching.rb in the lib folder.

** Note that the first row should be a header, the code runs on the second row down.


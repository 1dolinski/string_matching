![Image Alt](https://github.com/ebbflowgo/essays/raw/master/images/string_matching.png)


string_matching
===============

##### A quick and dirty way to find the similarity between two strings. Please fork it if you would like to change it.


![Image Alt](https://github.com/ebbflowgo/essays/raw/master/images/Output_Example.png)

### About

Say you have two lists. List 1 and List 2. You have been asked to check if each word in List 1 exists in List 2. Using a program such as Excel, you would use the VLOOKUP function or something similar to check if each word were in the other list. 

It gets interesting when the names are *similar but not the exact same*. For example, what if one name was "Lastname, Firstname" and the other one was "FIRSTNAME LASTNAME"? They are similar but not the same. How do we match these?

For this situation it is useful to use something like the [JaroWinkler](http://en.wikipedia.org/wiki/Jaro%E2%80%93Winkler_distance) distance to measure the similarity between two strings. 


### Setup

1. Install [Ruby - Windows](http://rubyinstaller.org/)  or the Mac alternative
2. Setup rubygems, gem install [scorer, amatch, parallel]
3. Open an excel sheet, name one tab "one" and another "two"
4. Put your benchmark words, the worsts you would like to find, in Column A of tab "one"
5. Put the words that you would like to compare against in Column A of tab "two"

** Note that the first row should be a header, the code runs on the second row down.


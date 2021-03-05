# Wordictionary

#### This project will allow users to add, update, and delete multiple words and multiple definitions associated with each word.

#### By Geof Rosenmund

## Technologies Used

* Ruby
* Sinatra
* RSPEC
* Pry 
* Capybara


## Description

This checker will take two inputs, both words and phrases.  It check to make sure there is at least one vowel and no numbers in the words. If that test passes, it will strip punctuation and whitespace from the inputted string.  Next, it converts the string into an array of single letters. The checker then sorts these arrays alphabetically and then checks to see if the arrays are the same. If they are not anigrams, it calls an another method to determine if there are no letter matches. If there are a few matches, the checker will count the number of letter matches and then display those letters.

## Setup/Installation Requirements

You can either click on the Heroku link below, or follow the subsequent instructions to work from Git Hub:

* Clone repository from Github
* Navigate to the top level of the project directory
* To create the Gemfile.lock: $ bundle install
* To run the script: $ ruby app.rb
* In your browser, navigate to localhost:4567  

## Git Hub link:

https://github.com/CrankyJones/wordictionary


## Heroku link:



## Known Bugs

* No known bugs at this time.


## **License**
[MIT](https://opensource.org/licenses/MIT)
Copyright (c) [2021] [Geof Rosenmund]

## **Contact Information**
Geof Rosenmund (geof.rosenmunds.email@gmail.com)
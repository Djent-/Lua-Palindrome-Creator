Lua Palindrome Creator
======================

Port of the Python code at http://codegolf.stackexchange.com/a/16454 by jcw to Lua, on this day December 30th 2013 CE at 2:48 PM EST by Patrick Hurd.

Takes a single string as an argument, and will return the longest panindrome that can be created using the characters contained in the string. The function does not modify case, so uppercase and lowercase characters will be considered different, and not count towards each other's total in the palindrome. The middle character will be the last character in the original string that occurs an odd number of times.

Example usage:

print(createPalindrome("racecar")) 	
  -> "racecar"

print(createPalindrome("hello"))
  -> "lol"

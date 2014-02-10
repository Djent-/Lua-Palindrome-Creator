--[[
Port of the Python code at http://codegolf.stackexchange.com/a/16454 by jcw
to Lua, on this day December 30th 2013 CE at 2:48 PM EST by Patrick Hurd.
Updated on this day February 10th 2014 CE at 10:09 AM EST by Patrick Hurd.

Takes a single string as an argument, and will return the longest panindrome
that can be created using the characters contained in the string. The function
does not modify case, so uppercase and lowercase characters will be considered
different, and not count towards each other's total in the palindrome. Letters
in the finished palindrome will be in order of paired occurence in the original
string on each side of the middle character. The middle character will be the
last character in the original string that occurs an odd number of times.

Example usage:

print(createPalindrome("racecar"))
	-> "racecar"
print(createPalindrome("hello"))
	-> "lol"
--]]

function createPalindrome(str)
	if type(str) ~= "string" then return "no string" end
	if #str == 0 then return "" end
	charList, occurances = {}, {}
	for x = 1, string.len(str) do
		currentChar = string.char(string.byte(string.sub(str,x,x)))
		if not occurCheck_c(charList, currentChar) then
			charList[#charList+1] = currentChar
			occurances[#occurances+1] = 1
		else
			local ind = index(charList, currentChar)
			occurances[ind] = occurances[ind] + 1
		end
	end
	if sum(occurances) == #occurances then return charList[1] end
	first, second, middle = "", "", ""
	for i, v in ipairs(charList) do
		occ = math.floor(occurances[i]/2)
		first = first .. string.rep(v, occ) --v rather than charList[i]
		second = second .. string.rep(v, occ)
		if occurances[i]%2 ~= 0 then
			middle = v
		end
	end
	return first .. middle .. string.reverse(second)
end

function sum(array)
	if not array then return 0 end
	if #array == 0 then return 0 end
	total = 0
	for x = 1, #array do
		total = total + array[x]
	end
	return total
end

function occurCheck_c(list, data)
	if #list == 0 then return false end
	for i = 1, #list do
		if list[i] == data then return true end
	end
	return false
end

function index(array, char)
	if #array == 0 then return 0 end
	for i = 1, #array do
		if array[i] == char then return i end
	end
end

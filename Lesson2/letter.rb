#a,e,i,o,u,y
letters = {}

i = 1
('a'..'z').map do |letter|
  letters[letter] = i if nil != (letter =~ /[aeiouy]/)
  i += 1
end
puts letters.inspect

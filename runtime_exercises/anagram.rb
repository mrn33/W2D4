# O(n!)
def anagram?(str1, str2)
  chars = str1.split("")
  anagrams = anagrams(str1)
  
  anagrams.include?(str2)
end

def anagrams(word)
  return [word] if word.length <= 1
  ana = []
  
  word.each_char.with_index do |chr, idx|
    anagrams(word[0...idx] + word[(idx + 1)..-1]).each do |sub_ana|
      ana << chr + sub_ana
    end
  end
  
  ana
end

# O(n^2)
def second_anagram?(str1, str2)
  str1.each_char do |chr|
    if str2.include?(chr)
      str1.slice!(str1.index(chr))
      str2.slice!(str2.index(chr))
    end
  end
  
  str1.empty? && str2.empty?
end

# O(n^2) - quicksort may run faster than second_anagram's O(n^2) time
def third_anagram?(str1, str2)
  str1.chars.sort.join == str2.chars.sort.join
end

# O(n)
def fourth_anagram(str1, str2)
  letters = Hash.new(0)
  
  str1.each_char { |chr| letters[chr] += 1 }
  str2.each_char { |chr| letters[chr] -= 1 }
  letters.values.all? { |val| val == 0 }
end

1. Merge Strings Alternately
	
	Scenario_1:	
		word1 = "abc"
		word2 = "pqr"
		scenario_1(word1, word2)
		def scenario_1(word1, word2)
			a = merge_alternately(word1, word2)
			output = "apbqcr"
			return a == output
		end

	Scenario_2:	
		word1 = "abc"
		word2 = "pqrst"
		scenario_2(word1, word2)
		def scenario_2(word1, word2)
			a = merge_alternately(word1, word2)
			output = "apbqcrst"
			return a == output
		end

	Scenario_2:	
		word1 = "abcde"
		word2 = "pqr"
		scenario_3(word1, word2)
		def scenario_3(word1, word2)
			a = merge_alternately(word1, word2)
			output = "apbqcrde"
			return a == output
		end

	def merge_alternately(word1, word2)
		new_string = ''
    for i in 0..word1.length-1 do
        new_string += word1[i] unless word1[i].nil?
        new_string += word2[i] unless word2[i].nil?
        new_string += word2.slice(i+1..-1) if word1.length == i+1 && !(word2[i].nil?)
    end
    return new_string
	end

	for i in 0..10 do 
		puts i
	end

	merge_alternately("abc", "pqr")

	def merge_alternately(word1, word2)
	  result = ''

	  0.upto([word1.size, word2.size].min - 1) do |i|
	    result += word1[i] + word2[i]
	  end

	  result += word1.size < word2.size ? word2[word1.size..] : word1[word2.size..]
	end
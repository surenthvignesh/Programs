1.  Max Pair Sum in an Array
	You are given an integer array nums. You have to find the maximum sum of a pair of numbers from nums such that the largest digit in both numbers is equal.
	For example, 2373 is made up of three distinct digits: 2, 3, and 7, where 7 is the largest among them.
	Return the maximum sum or -1 if no such pair exists.

	Example 1:
	Input: nums = [112,131,411]
	Output: -1
	Explanation:
	Each numbers largest digit in order is [2,3,4].

	Example 2:
	Input: nums = [2536,1613,3366,162]
	Output: 5902
	Explanation:
	All the numbers have 6 as their largest digit, so the answer is 2536 + 3366 = 5902.

	Example 3:
	Input: nums = [51,71,17,24,42]
	Output: 88
	Explanation:
	Each number's largest digit in order is [5,7,7,4,4].
	So we have only two possible pairs, 71 + 17 = 88 and 24 + 42 = 66.
'	 

	Constraints:

	2 <= nums.length <= 100
	1 <= nums[i] <= 104

# Program starts---------

	def max_sum(nums)
		# Get max values in each array elements
		get_max_val_arr = []
    nums.each_with_index do |num_val, index|
    	get_max_val_arr << num_val.to_s.split('').map {|i| i.to_i}.max(1).last
    end

    # Get max values index
    if get_max_val_arr.uniq.count == 1
    	return nums.max(2).sum
    elsif pair_values = get_max_pair_count(get_max_val_arr, nums)
    	return pair_values
    end
	end

	def get_max_pair_count(get_max_val_arr, nums)
		# get_max_val_arr.group_by(&:itself).map {|k, v| [k, v.count]}.to_h.sort_by {|key, val| val}.reverse.first
		if get_max_val_arr.count == get_max_val_arr.uniq.count
			-1
		else
			max_hashes = get_max_val_arr.group_by(&:itself).map {|k, v| [k, v.count]}.to_h.select {|k, v| v >=2 }.sort_by {|key, val| key }.reverse.to_h
			
			n_hash = {}
			max_hashes.each do |k, v| 
				max_vals_index = get_max_val_arr.each_with_index.map {|val, index| index if k == val}.compact
				n_hash[k] = nums.select.with_index {|num_val, index| (max_vals_index.include? index)}.max(2).sum
			end

			n_hash.sort_by {|k, v| v}.reverse.to_h.first[1]
		end
	end

# Program ends ---------

	nums = [84,91,18,59,27,9,81,33,17,58]
	165
	max_sum(nums)

	nums = [31,25,72,79,74]
	max_sum(nums)
	146

	nums = [51,71,17,24,42]
	max_sum(nums)
	88

	nums = [112,131,411]
	max_sum(nums)
	-1
	
	nums = [2536,1613,3366,162]
	max_sum(nums)
	5902

	Tested with leetcode



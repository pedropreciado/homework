def sluggish(arr)
  largest = arr[0]
  arr.each do |fish1|
    arr.each do |fish2|
      largest = fish1 if fish1.length > fish2.length
      largest = fish2 if fish2.length > fish1.length
    end
  end
  largest
end

p sluggish(['fish', 'fiiish', 'fiiiiish', 'fiiiish',
  'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

def dominant(arr)
  arr.sort_by {|arr| arr.length}[-1]

end

p dominant(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

def clever(arr)
  largest = arr[0]
  i = 1
  while i < arr.length
    largest = arr[i] unless arr[i].length < largest.length
    i += 1
  end
  largest
end

p clever(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

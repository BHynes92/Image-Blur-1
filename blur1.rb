class Image
  attr_accessor :arr

  def initialize(arr)
    self.arr = arr
  end

  def output_image
    puts "#{self.arr[0].join}"
    puts "#{self.arr[1].join}"
    puts "#{self.arr[2].join}"
    puts "#{self.arr[3].join}"
  end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image
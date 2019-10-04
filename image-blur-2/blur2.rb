class ImageBlur

  def initialize(array)
    @array = array
    @row_length = array.length
    @col_length = array[0].length
  end

  def output_image
    @array.each do |row|
      puts row.join
    end
  end

  def ones
    one_coordinates = []
    @array.each_with_index do |row_array, row_id|
        row_array.each_with_index do |value, col_id|
        if value == 1
          one_coordinates << [row_id, col_id]
        end
      end
    end
    one_coordinates
  end

 def blur(row_id, col_id)
    @array[row_id -1][col_id] = 1 unless row_id == 0
    @array[row_id +1][col_id] = 1 unless row_id >= @row_length-1
    @array[row_id][col_id -1] = 1 unless col_id == 0
    @array[row_id][col_id +1] = 1 unless col_id >= @col_length-1
  end

  def transform
    blur_coordinates = ones
    blur_coordinates.each do |x, y|
      blur(x, y)
    end
  end

end

img = ImageBlur.new([
  [1, 0, 0, 0, 0],
  [0, 0, 0, 1, 0],
  [0, 0, 1, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0],
  [1, 0, 0, 1, 0],
  [0, 0, 0, 0, 0]
])

puts "The starting image is:"
img.output_image
puts "Which gets \"blurred\" into:"
img.transform
img.output_image
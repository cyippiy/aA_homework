def sluggish_octopus(array)
  max_fish = 0

  array.each_with_index do |fish,idx|
    array.each_with_index do |fishes,idj|
      next if idx == idj
      if fish.length < array[idj].length
        max_fish = idj
      end
    end
  end
  return array[max_fish]
end


fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish',
'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']


class Array

  def merge_sort(&prc)
    prc ||= Proc.new {|x,y| x<=>y}

    return self if count <= 1

    mid = count/2

    left = self.take(mid).merge_sort(&prc)
    right = self.drop(mid).merge_sort(&prc)

    Array.merge(left,right,&prc)
  end

  def clever_fish
    max_idx = 0

    each_index do |idx|
      max_idx = idx if self[max_idx].length < self[idx].length
    end

    self[max_idx]
  end

  private
  def self.merge(left,right,&prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first,right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end
    merged + left + right
  end

end

def slow_dance(dir,array)

  array.each_with_index do |direction,idx|
    return idx if dir == direction
  end

end

def face_dance(dirs,hash)
  hash[dirs]
end

# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]


p sluggish_octopus(fishes)
p fishes.merge_sort{|x,y| x.length <=> y.length}.last
p fishes.clever_fish
# p slow_dance("left",tiles_array)

class Array 
  def [](index)
    content = at(index) # returns element at index into content
    content.nil? ? '\0' : content # replace to \0 if element is nil
  end

  def map(sequence = nil, &block)
    arr = []

    if sequence.nil? # empty case
      each { |x| arr.push(block.call(x)) }
    else
      seq_array = sequence.to_a # convert range into array
      seq_array.each do |index| # iterate index in seq
        arr.push(block.call(self[index])) if index >= -self.length && index <= self.length-1 
      end
    end
    
    return arr
  end
end

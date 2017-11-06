class Hamming
  def self.compute_distance(original, mutation)
    # Check for length equal
    unless original.length.eql? mutation.length
      raise ArgumentError
    end
    # go through original and mutation
    difference = 0
    mutation_char = mutation.split("")
    original.each_char.with_index(0) do |character, index|
      unless mutation_char[index] == character.to_s
        difference = difference + 1
      end
    end
    
    difference
  end
end


def contain_virus(isInfected)
  #initialize lengths of row/columns
  m = isInfected.length
  n = isInfected[0].length

  walls = 0
  for row in 0...m
    for col in 0...n
      if isInfected[row][col] == 1 #iterating and checking current cell
        neighbor = 0 #counter for number of neighbors
        #checks adjacent 4 squares for infection
        if row + 1 < m && isInfected[row + 1][col] == 1
          neighbor += 1 
        elsif col + 1 < n && isInfected[row][col + 1] == 1
          neighbor += 1 
        elsif row - 1 >= 0 && isInfected[row - 1][col] == 1
          neighbor += 1 
        elsif col - 1 >= 0 && isInfected[row][col - 1] == 1
          neighbor += 1 
        end
        
        walls += (4 - neighbor)  #adds to wall counter every iteration
      end
    end
  end

  return walls
end

# Test cases
isInfected = [[0,0,1,0],[1,1,0,1],[0,0,0,0],[1,0,1,0]]
result = contain_virus(isInfected)
puts "Number of walls needed: #{result}"

isInfected = [[0,0,1,1],[1,1,1,1],[0,0,1,0],[1,0,0,0]]
result = contain_virus(isInfected)
puts "Number of walls needed: #{result}"

isInfected = [[0,1,0,0],[1,0,0,1],[0,0,0,0],[1,0,1,0]]
result = contain_virus(isInfected)
puts "Number of walls needed: #{result}"

isInfected = [[0,1,1],[1,1,0],[0,0,0],[1,0,1]]
result = contain_virus(isInfected)
puts "Number of walls needed: #{result}"

isInfected = [[1,0,1,0, 1],[1,1,0,1,0],[0,1,1,0,1],[0,0,1,0,1]]
result = contain_virus(isInfected)
puts "Number of walls needed: #{result}"
class MineField
  def initialize(x, y)
    @cells = []
    0..x.each do |i|
      cells[i] = []
      0..y.each { |j| cells[i][j] = {mine: false, revealed: false, neighbor_mines: 0} }
    end
    
    # calculate number of neighbor mines
    0..x.each do |i|
      cells[i] = []
      0..y.each do |j|
       neighbor_mines = 0
       neighbor_mines++ if x > 0 && y > 0 && cells[x-1][y-1][:mine]
       neighbor_mines++ if x > 0 && cells[x-1][y][:mine]
       neighbor_mines++ if x > 0 && y < cells[x-1].size - 1 && cells[x-1][y+1][:mine]
       ...
       cells[i][j][:neighbor_mines] = neighbor_mines
      end
    end
  end
  
  def reveal(x, y)
    # TODO: bounds checking
    
    return if cells[x][y][:revealed]
     
    if cells[x][y][:mine]
      gameover()
      return
    end

    cells[x][y][:revealed] = true
    
    if cells[x][y][:neighbor_mines] == 0
       reveal(x-1, y-1) if x > 0 && y > 0
       reveal(x-1, y) if x > 0
       reveal(x-1, y+1) if x > 0 && y < cells[x-1].size - 1
       ...
    end
  end
end

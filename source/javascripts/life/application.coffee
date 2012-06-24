window.Life = {
  world: null
  x: null
  y: null

  initialize: (x, y) ->
    @x = x
    @y = y
    states = [true, false]
    rows = for row in [0..y-1]
      cells = for column in [0..x-1]
        isAlive = states[Math.floor(Math.random()*states.length)]
        new Cell(x: column, y: row, isAlive: isAlive)
      cellsCollection = new CellsCollection(cells)
      row = new Row(cells: cellsCollection)
    rowsCollection = new RowsCollection(rows)
    @world = new World(rows: rowsCollection)

    worldView = new WorldView(
      model: @world
      el: $('#world')
    )
    worldView.render()

    @world.meetNeighbors()

  regenerate: ->
    fateGrid = @world.generateFateGrid()
    for y in [0..@y-1]
      for x in [0..@x-1]
        Life.world.getCell([x,y]).set('isAlive', fateGrid[y][x])
}

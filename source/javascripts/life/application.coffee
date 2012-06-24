window.Life = {
  world: null

  initialize: (x = 10, y = 10) ->
    states = [true, false]
    rows = for row in [1..y]
      cells = for cell in [1..x]
        isAlive = states[Math.floor(Math.random()*states.length)]
        new Cell(isAlive: isAlive)
      cellsCollection = new CellsCollection(cells)
      row = new Row(cells: cellsCollection)
    rowsCollection = new RowsCollection(rows)
    @world = new World(rows: rowsCollection)

    worldView = new WorldView(
      model: @world
      el: $('#world')
    )

    worldView.render()
}

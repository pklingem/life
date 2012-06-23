window.Life = {
  world: null

  initialize: (x = 100, y = 100) ->
    states = ['alive', 'dead']
    rows = for row in [1..y]
      cells = for cell in [1..x]
        state = states[Math.floor(Math.random()*states.length)]
        new Cell(state: state)
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

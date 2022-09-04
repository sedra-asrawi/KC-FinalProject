import PlaygroundSupport
import SwiftUI

// MARK: - Game

extension TicTacToe.Board {
    var hasNonEmptyCells: Bool {
        self.flatMap { $0 }
            .contains(where: { $0 != .empty })
    }

    var hasEmptyCells: Bool {
        self.flatMap { $0 }
            .contains(where: { $0 == .empty })
    }

    static var empty: TicTacToe.Board {
        let line = Array<TicTacToe.Cell>(repeating: TicTacToe.Cell.empty, count: 3)
        return Array(repeating: line, count: 3)
    }

    var lineIndexes: [[TicTacToe.BoardIndex]] {
        [
            [(0, 0), (0, 1), (0, 2)],
            [(1, 0), (1, 1), (1, 2)],
            [(2, 0), (2, 1), (2, 2)],
            [(0, 0), (1, 0), (2, 0)],
            [(0, 1), (1, 1), (2, 1)],
            [(0, 2), (1, 2), (2, 2)],
            [(0, 0), (1, 1), (2, 2)],
            [(0, 2), (1, 1), (2, 0)],
        ]
    }
}

struct TicTacToe {
    enum Player: CaseIterable {
        case x, o

        static var random: Player {
            return Player.allCases.randomElement()!
        }

        var next: Player {
            switch self {
            case .x: return .o
            case .o: return .x
            }
        }

        var label: String {
            switch self {
            case .x: return "X"
            case .o: return "O"
            }
        }
    }

    enum Cell: Equatable {
        case empty, playedBy(Player)
    }

    enum GameState: Equatable {
        case duece
        case won(by: Player)
        case turn(of: Player)

        var didWin: Bool {
            switch self {
            case .won: return true
            default: return false
            }
        }
    }

    typealias BoardIndex = (row: Int, column: Int)
    typealias Board = [[Cell]]

    private var board: Board = .empty
    private(set) var state: GameState = .turn(of: Player.random)

    var winner: Player? {
        winnerInfo.map { $0.winner }
    }

    var winningLine: [BoardIndex]? {
        winnerInfo.map { $0.line }
    }

    private var winnerInfo: (line: [BoardIndex], winner: Player)? {
        for indexes in board.lineIndexes {
            let line = indexes.map { self.cellAt($0.0, $0.1) }
            switch (line[0], line[1], line[2]) {
            case let (.playedBy(p0), .playedBy(p1), .playedBy(p2))
                where p0 == p1 && p1 == p2:
                return (line: indexes, winner: p0)
            default: continue
            }
        }

        return nil
    }

    mutating func play(_ row: Int, _ column: Int) {
        // Validate
        guard case let .turn(playerWithTurn) = state else {
            return
        }

        guard board[row][column] == .empty else { return }

        // Play
        board[row][column] = .playedBy(playerWithTurn)

        // Update game state
        if let winner = winner {
            state = .won(by: winner)
            return
        }

        guard board.hasEmptyCells else {
            state = .duece
            return
        }

        state = .turn(of: playerWithTurn.next)
    }

    mutating func replay() {
        guard board.hasNonEmptyCells else { return }

        board = .empty

        switch state {
        case let .won(by: player),
             let .turn(of: player):
            state = .turn(of: player.next)
        default:
            state = .turn(of: Player.random)
        }
    }

    func cellAt(_ row: Int, _ column: Int) -> Cell {
        board[row][column]
    }
}

// MARK: - View

struct TicTacToeView: View {
    @State var game = TicTacToe()

    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            TicTacToeHeaderView(gameState: game.state)

            TicTacToeBoardView { row, column in
                TicTacToeCellView(cell: self.game.cellAt(row, column)) {
                    self.game.play(row, column)
                }
            }
            .overlay(TicTacToeWinningLineView(winningLine: game.winningLine))

            Button(action: { self.game.replay() },
                   label: { Text("Replay") })
        }
    }
}

struct TicTacToeHeaderView: View {
    let gameState: TicTacToe.GameState
    init(gameState: TicTacToe.GameState) {
        self.gameState = gameState
    }

    var body: some View {
        switch gameState {
        case .duece: return Text("Duece")
        case let .turn(of: player): return Text("Player \(player.label) turn")
        case let .won(by: player): return Text("Won by \(player.label)")
        }
    }
}

struct TicTacToeBoardView: View {
    let createCellHandler: (Int, Int) -> TicTacToeCellView
    init(createCellHandler: @escaping (Int, Int) -> TicTacToeCellView) {
        self.createCellHandler = createCellHandler
    }

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            ForEach(0..<3) { column in
                HStack(alignment: .center, spacing: 10) {
                    ForEach(0..<3) { row in
                        self.createCellHandler(row, column)
                    }
                }
            }
        }
    }
}

struct TicTacToeCellView: View {
    let cell: TicTacToe.Cell
    let didTapHandler: () -> ()
    let size: CGFloat = 60

    init(cell: TicTacToe.Cell, didTapHandler: @escaping () -> ()) {
        self.cell = cell
        self.didTapHandler = didTapHandler
    }

    var body: some View {
        Button(
            action: didTapHandler,
            label: { cellContent })
    }

    private var cellContent: some View {
        ZStack {
            Rectangle()
                .scaledToFill()
                .foregroundColor(Color.blue)

            cross
                .animation(.spring())
                .opacity(cell == .playedBy(.x) ? 1 : 0)

            circle
                .animation(.spring())
                .opacity(cell == .playedBy(.o) ? 1 : 0)

        }
        .frame(width: self.size, height: self.size)
        .fixedSize(horizontal: true, vertical: true)
    }

    let inset = Length(10)
    let lineWidth = Length(5)

    private var circle: some View {
        Circle()
            .inset(by: inset)
            .stroke(Color.white, lineWidth: lineWidth)
    }

    private var cross: some View {
        GeometryReader { geometry in
            Path { path in
                let xmin = self.inset
                let xmax = geometry.size.width - self.inset
                let ymin = self.inset
                let ymax = geometry.size.height - self.inset

                path.move(to: CGPoint(x: xmin, y: ymin))
                path.addLine(to: CGPoint(x: xmax, y: ymax))
                path.move(to: CGPoint(x: xmin, y: ymax))
                path.addLine(to: CGPoint(x: xmax, y: ymin))
            }
            .stroke(Color.white, lineWidth: self.lineWidth)
        }
    }
}

struct TicTacToeWinningLineView: View {
    let winningLine: [TicTacToe.BoardIndex]?
    init(winningLine: [TicTacToe.BoardIndex]?) {
        self.winningLine = winningLine
    }

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                guard let line = self.winningLine else { return }

                let cellMargin: CGFloat = 10
                let strokeWidth = (geometry.size.width + cellMargin) / 3 * 2
                let min = (geometry.size.width - strokeWidth) / 2
                let center = geometry.size.width / 2
                let max = min + strokeWidth

                func coordinate(for index: Int) -> CGFloat {
                    switch index {
                    case 0: return min
                    case 1: return center
                    case 2: return max
                    default: fatalError()
                    }
                }

                path.move(to: CGPoint(x: coordinate(for: line[0].0),
                                      y: coordinate(for: line[0].1)))
                path.addLine(to: CGPoint(x: coordinate(for: line[2].0),
                                         y: coordinate(for: line[2].1)))
                
            }
            .stroke(style: StrokeStyle(lineCap: .round))
            .stroke(Color.orange, lineWidth: 6)
        }
    }
}

PlaygroundPage.current.liveView = UIHostingController(rootView: TicTacToeView())

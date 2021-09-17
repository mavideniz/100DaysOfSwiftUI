import SwiftUI

struct ContentView: View {
    
    private var moves: [String] = ["🪨", "📃", "✂️"]
    
    @State var score: Int = 0
    @State var currentMove: Int = Int.random(in: 0...2)
    @State var shouldWin: Bool = Bool.random()
    @State var status: String = ""
    @State var count: Int = 0
    
    var body: some View {
        
        VStack() {
            
            Spacer()
            
            VStack(spacing: 10){
                
                if(count == 10){
                    Text("Score: \(score)")
                        .font(.title)
                }
                
                Text("Your move: \(moves[currentMove])")
                    .font(.title)
                
                
                if shouldWin {
                    Text("Win")
                        .font(.largeTitle)
                        .bold()
                }else {
                    Text("Lose")
                        .font(.largeTitle)
                        .bold()
                }
                
            }
            
            Spacer()
            
            VStack(spacing: 16) {
                ForEach(0 ..< moves.count){ move in
                    Button(moves[move]) {
                        checkResults(move: move)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, idealHeight: 44)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                }
            }
            
            Spacer()
            
            Text("\(status)")
                .font(.caption)
            
        }
        .padding()
        
    }
    
    func appsTurn() {
        self.currentMove = Int.random(in: 0...2)
        self.shouldWin = Bool.random()
        self.count += 1
    }
    
    func checkResults(move: Int){
        
        var beat: Bool = false
        
        if (self.currentMove == 2 && move == 0){
            beat = true
        }else if (self.currentMove + 1 == move){
            beat = true
        }
        
        if(beat == shouldWin){
            score += 1
        }else {
            score -= 1
        }
        
        self.status = """
                         The player tapped \(moves[move]),
                         the player was trying to \(shouldWin ? "Win" : "Lose"),
                         and the app chose \(moves[currentMove]),
                         so \(beat == shouldWin ? "add 1 point" : "subtract 1 point").
                      """
        
        if(count == 10){
            count = 0
        }
        
        self.appsTurn()
         
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

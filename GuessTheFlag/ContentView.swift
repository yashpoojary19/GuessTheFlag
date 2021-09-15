//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Yash Poojary on 15/09/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Russia", "Nigeria", "Poland", "US", "Germany", "UK"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var alertMessage = ""

    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack(spacing: 10) {
                VStack {
                            Text("Tap the flag of")
                                .foregroundColor(.white)
                                .padding(.top, 80)
                            Text(countries[correctAnswer])
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .fontWeight(.black)
                                
    
                    
                }
    
                ForEach(0..<3) { number in
                    Button(action: {
                        flagTapped(number)
                    }) {
                        Image(countries[number])
                            .renderingMode(.original)
                    }
                    .clipShape(Capsule())
                    .shadow(color: .black, radius: 2)
                    
                }
                
                Text("Your current score is \(score)")
                    .foregroundColor(.white)
                    .font(.title)
                
                Spacer()

            }
        }
        
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("\(alertMessage)"), dismissButton: .default(Text("Continue")) {
                    askQuestion()
            }
                  
            )
        }
        
        
        
        
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            alertMessage = "You are right."
            score += 1
        } else {
            scoreTitle = "Wrong"
            alertMessage = "That's the flag of \(countries[number])."
            score -= 1
        }
        
        showingScore = true
    
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

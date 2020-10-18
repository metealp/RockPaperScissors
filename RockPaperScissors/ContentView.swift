//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Mete Alp Kizilcay on 18.10.2020.
//

import SwiftUI

struct ContentView: View {
    let options = ["Rock", "Paper", "Scissors"]
    @State private var didUserWin: Bool = true
    @State private var score: Int = 0
    @State private var showAlert = false
    
    @State private var alertMessage = ""
    @State private var alertTitle = ""
    
    var body: some View {
        VStack{
            Text("Hello, world!")
                .padding()
            Spacer()
            HStack{
                ForEach(0 ..< options.count){ i in
                    Button(action: {self.optionTapped(options[i])}
                    , label: {
                        Text("\(options[i])")
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(20.0)
                            .frame(minWidth: 100, idealWidth: 150, maxWidth: 200, minHeight: 90, idealHeight: 100, maxHeight: 120, alignment: .center)
                    })
                }
            }
            Spacer()
            Text("Your score is \(score)")
            
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("\(alertTitle)"), message: Text("\(alertMessage)"), dismissButton: .default(Text("Continue")){self.dismissAlert()
                
            })
        }
    }
    func optionTapped(_ tappedButton: String) {
        didUserWin = Bool.random()
        if didUserWin == true {
            score += 1
            alertTitle = "Congratulations!"
            switch tappedButton {
            case "Rock":
                alertMessage = "Rock beats Scissors!"
            case "Paper":
                alertMessage = "Paper beats Rock!"
            case "Scissors":
                alertMessage = "Scissors beats Paper!"
            default:
                alertMessage = "What is going on there?"
            }
        } else {
            alertTitle = "Wrong!"
            alertMessage = "It is OK. Try again?"
        }
        showAlert = true
    }
    func dismissAlert(){
        showAlert = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


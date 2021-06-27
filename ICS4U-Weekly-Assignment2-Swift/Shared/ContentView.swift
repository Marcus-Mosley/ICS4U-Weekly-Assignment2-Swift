//
// ContentView.swift
// ICS4U-Weekly-Assignment2-Swift
//
// Created by Marcus A. Mosley on 2021-01-27
// Copyright (C) 2021 Marcus A. Mosley. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var text: [String] = Array(repeating: "", count: 2)
    @State private var player: String = ""
    @State var showingAlert: Bool = false
    
    var body: some View {
        VStack {
            Text("\(text[0]) \(text[1])")
                .font(.body)
            TextField("What do you choose?", text: $player)
                .padding()
            Button( action: {
                player = player.uppercased()
                if player == "ROCK" {
                    text = check(player)
                } else if player == "PAPER" {
                    text = check(player)
                } else if player == "SCISSORS" {
                    text = check(player)
                } else {
                    showingAlert = true
                }
            }) {
                Text("Rock, Paper, Scissors!")
                    .padding([.leading, .trailing], 40)
                    .padding()
                    .background(Color(.systemPink))
                    .cornerRadius(25)
                    .foregroundColor(.white)
            }.alert(isPresented: $showingAlert) {
                Alert(title: Text("Important Message"), message: Text("Not Valid Input"), dismissButton: .default(Text("Got It!")))
            }
            .padding()
        }
    }
    
    // Checks who won in Rock, Paper, Scissors!
    func check(_ player: String) -> [String] {
        let random: Int = Int.random(in: 1...3)
        var cpu: String = ""
        var outcome: String = ""
        var text: [String] = Array(repeating: "", count: 2)
        
        if (random == 1) {
            cpu = "I choose ROCK!"
            if (player.contains("ROCK")) {
                outcome = "A Tie? I will beat you next Time!"
            } else if (player.contains("PAPER")) {
                outcome = "Oh no, I lost! How did you find out my trick of always playing Rock?"
            } else if (player.contains("SCISSORS")) {
                outcome = "I win! Please Try Again."
            }
        } else if (random == 2) {
            cpu = "I choose PAPER!"
            if (player.contains("ROCK")) {
                outcome = "I win! Please Try Again."
            } else if (player.contains("PAPER")) {
                outcome = "A Tie? I will beat you next Time!"
            } else if (player == "SCISSORS") {
                outcome = "Oh no, I lost! How did you find out my trick of always playing Paper?"
            }
        } else if (random == 3) {
            cpu = "I choose SCISSORS!"
            if (player.contains("ROCK")) {
                outcome = "Oh no, I lost! How did you find out my trick of always playing Scissors?"
            } else if (player.contains("PAPER")) {
                outcome = "I win! Please Try Again."
            } else if (player.contains("SCISSORS")) {
                outcome = "A Tie? I will beat you next Time!"
            }
        }
        
        text[0] = cpu
        text[1] = outcome
        return text
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

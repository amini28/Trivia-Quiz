//
//  ContentView.swift
//  Trivia
//
//  Created by Amini on 02/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var triviaManager = TriviaManager()
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text("QUIZ")
                        .font(.system(size: 46, design: .monospaced))
                        .fontWeight(.bold)
                        .padding(20)
                        .background(.white)

                    
                    Text("Are you ready to test out your trivia skills ?")
                        .foregroundColor(Color("AccentColor"))
                }
                
                NavigationLink {
                    TriviaView()
                        .environmentObject(triviaManager)
                } label: {
                    PrimaryButton(text: "Let's go!")
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
//            .background(Color("BaseColor"))
            .background(
                LinearGradient(colors: [.yellow, .orange], startPoint: .leading, endPoint: .trailing)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

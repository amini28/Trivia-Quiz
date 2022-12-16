//
//  QuestionView.swift
//  Trivia
//
//  Created by Amini on 02/08/22.
//

import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject var triviaManager: TriviaManager
    
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Trivia Game")
                    .lilacTitle()
                
                Spacer()
                
                Text("\(triviaManager.index + 1) out of \(triviaManager.length)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            
            ProgressBar(progress: triviaManager.progress)
            
            Text(triviaManager.question)
                .font(.system(size: 18))
                .bold()
                .foregroundColor(Color.black)
                .padding(20)
                .background(.white)
                .background(Pinggiran(type: .topRight).stroke(.black, lineWidth: 2).padding(-8))
                .background(Pinggiran(type: .topLeft).stroke(.black, lineWidth: 2).padding(-8))
                .background(Pinggiran(type: .bottomLeft).stroke(.black, lineWidth: 2).padding(-8))
                .background(Pinggiran(type: .bottomRight).stroke(.black, lineWidth: 2).padding(-8))
                .rotationEffect(Angle(degrees: -2))

            
            VStack(alignment: .leading, spacing: 36) {
                let rotate = 1.0
                ForEach(Array(triviaManager.answerChoices.enumerated()), id: \.offset) {  index, answer in
                    AnswerRow(answer: answer)
                        .environmentObject(triviaManager)
                        .rotationEffect(Angle(degrees: index % 2 == 0 ? rotate * -1 : rotate * 1))
                }

            }
            
//            Button {
//                triviaManager.goToNextQuestion()
//            } label: {
//                PrimaryButton(text: "Next", background: triviaManager.answerSelected ? Color("AccentColor") : .gray.opacity(0.5))
//            }
//            .disabled(!triviaManager.answerSelected)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color("BaseColor"))
        .background(LinearGradient(colors: [.yellow, .orange], startPoint: .topLeading, endPoint: .bottomTrailing))
        .navigationBarHidden(true)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(TriviaManager())
    }
}

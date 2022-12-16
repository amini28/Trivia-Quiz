//
//  AnswerRow.swift
//  Trivia
//
//  Created by Amini on 02/08/22.
//

import SwiftUI

struct AnswerRow: View {
    
    @EnvironmentObject var triviaManager: TriviaManager
    
    var answer: Answer
    @State private var isSelected = false
    
    var body: some View {
        HStack(spacing: 20) {
//            Image(systemName: "circle.fill")
//                .font(.caption)
            
            Text(answer.text)
                .bold()
            
            if isSelected {
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? Color("RightColor") : Color("WrongColor"))
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
//        .foregroundColor(triviaManager.answerSelected ? (isSelected ? Color("AccentColor") : .gray) : Color("AccentColor"))
        .foregroundColor(.black)
        .background(.white)
        .background(Pinggiran(type: .topRight).stroke(.black, lineWidth: 2).padding(-8))
        .background(Pinggiran(type: .topLeft).stroke(.black, lineWidth: 2).padding(-8))
        .background(Pinggiran(type: .bottomLeft).stroke(.black, lineWidth: 2).padding(-8))
        .background(Pinggiran(type: .bottomRight).stroke(.black, lineWidth: 2).padding(-8))

//        .cornerRadius(10)
//        .shadow(color: isSelected ? (answer.isCorrect ? Color("RightColor") : Color("WrongColor")) : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !triviaManager.answerSelected {
                isSelected = true
                triviaManager.selectAnswer(answer: answer)
            }
        }
        
    }
}

enum PinggiranLineType {
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
    
}

struct Pinggiran: Shape {

    let type: PinggiranLineType
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        switch type {
        case .topLeft:
            path.move(to: CGPoint(x: rect.width / 3.0, y: 0))
            path.addLine(to: CGPoint(x:0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height / 3.0))
            
        case .topRight:
            path.move(to: CGPoint(x: rect.width - (rect.width / 3.0), y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height / 3.0))
            
        case .bottomLeft:
            path.move(to: CGPoint(x: rect.width / 3.0, y: rect.height))
            path.addLine(to: CGPoint(x:0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height - (rect.height / 3.0)))
            
        case .bottomRight:
            path.move(to: CGPoint(x: rect.width - (rect.width / 3.0), y: rect.height))
            path.addLine(to: CGPoint(x:rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height - (rect.height / 3.0)))
            
        }

        return path
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "Single", isCorrect: false))
            .environmentObject(TriviaManager())
    }
}

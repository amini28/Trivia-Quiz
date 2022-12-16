//
//  Answer.swift
//  Trivia
//
//  Created by Amini on 02/08/22.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}

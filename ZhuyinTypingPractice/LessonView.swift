//
//  ContentView.swift
//  ZhuyinTypingPractice
//
//  Created by Matthew on 7/12/22.
//

import SwiftUI


struct LessonView: View {
    let lesson: Lesson
    var highlightStatus: [GradeColor] = []
    var attributedText: AttributedString {
        let a = AttributedString(lesson.generatedText[0])
        //ok so next time you need to get one character with a bacground
        return a
        
    }
    
    init(lesson: Lesson){
        self.lesson = lesson
        self.highlightStatus = Array<GradeColor>(repeating: .up_next, count: self.lesson.syllables.count)
        self.highlightStatus = [.current]
        highlightStatus[0] = .current
        
    }
    var body: some View {
        Text("hi")
        
    }
}

enum GradeColor {
    case wrong
    case correct
    case current
    case up_next
    
    func color() -> UIColor{
        switch (self){
        case .wrong:
            return .red
        case .correct:
            return .green
        case .current:
            return .yellow
        case .up_next:
            return .black
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView(lesson: Lesson(syllables: b.syllables))
    }
}

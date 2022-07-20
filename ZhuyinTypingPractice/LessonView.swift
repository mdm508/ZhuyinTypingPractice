//
//  ContentView.swift
//  ZhuyinTypingPractice
//
//  Created by Matthew on 7/12/22.
//

import SwiftUI

struct LessonView: View {
    /// List of Syllables in the current lesson along with their current status
    @State var syllableStatuses: [SyllableStatus]
    /// Prouduces new syllable status tuple using the same syllable but new status
     init(syllables: [Syllable]){
         var syllableArray = syllables.map{ SyllableStatus(syllable: $0)}
         syllableArray[0].grade = .current
         // Required because @State vars can only be updated inside body
         self.syllableStatuses = syllableArray
     }
    /// Container for storing the status with a syllable.
    struct SyllableStatus {
        let syllable: Syllable
        var grade: GradeColor = .up_next
    }
    enum GradeColor {
        case wrong
        case correct
        case current
        case up_next
        
        func color() -> Color{
            switch (self){
            case .wrong:
                return .red
            case .correct:
                return .green
            case .current:
                return .yellow
            case .up_next:
                return .clear
            }
        }
        
    }
   
}

extension LessonView{
    var body: some View {
        SyllableView(syllableStatuses[0].syllable,
                     syllableStatuses[0].grade)
        
    }
   
}

struct SyllableView: View {
    let syllableText: String
    let statusColor: Color
    init(_ s: Syllable, _ g: LessonView.GradeColor){
        self.syllableText = s.syllable
        self.statusColor = g.color()
        
    }
}

extension SyllableView {
    var body: some View {
        return Text(syllableText).background(statusColor)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView(syllables: b.syllables)
    }
}

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
    @State private var userInput: String = ""
    
    /// Prouduces new syllable status tuple using the same syllable but new status
     init(syllables: [Syllable]){
         var syllableArray = syllables.map{ SyllableStatus(syllable: $0)}
         syllableArray[0].grade = .current
         // Required because @State vars can only be updated inside body
         self.syllableStatuses = syllableArray
     }
    /// Current syllable index
    var curIndex: Int {
        if let index = syllableStatuses.firstIndex(where: {$0.grade == .current}){
            return index
        } else {
            return 0
        }
    }
    
    func typedCorrectAnswer() -> Bool {
        print(syllableStatuses[curIndex].syllable.syllable)
        return syllableStatuses[curIndex].syllable.syllable == $userInput.wrappedValue
    }
    func validateCharacter(){
        
    }
    /// Container for storing the status with a syllable.
    struct SyllableStatus: Identifiable {
        let syllable: Syllable
        var grade: GradeColor = .up_next
        var id: UUID {
            syllable.id
        }
        var madeMistake = false
         mutating func markAsWrong(){
            self.madeMistake = true
        }
        mutating func updateStatus(newStatus: GradeColor){
            self.grade = newStatus
        }
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
        VStack(spacing: 10){
            Spacer()
        ForEach(syllableStatuses){s in
            SyllableView(s)
         }
            HStack{
            Spacer()
            TextField(
                "",
                text: $userInput
            )
            .onSubmit{
                if typedCorrectAnswer() {
                    let nextIndex = curIndex + 1
                    syllableStatuses[curIndex].grade =
                                                        syllableStatuses[curIndex].madeMistake ?
                                                        .wrong :
                                                        .correct
                    if nextIndex < syllableStatuses.count {
                        syllableStatuses[nextIndex].grade = .current
                    }
                } else {
                    syllableStatuses[curIndex].markAsWrong()
                }
            }
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .border(.secondary)
            }
            Spacer()
            
        }
    }
   
}

struct SyllableView: View {
    private let syllableStatus: LessonView.SyllableStatus
    private var syllableText: String {
        syllableStatus.syllable.syllable
    }
    private var color: Color {
        syllableStatus.grade.color()
    }
    init(_ s: LessonView.SyllableStatus){
        self.syllableStatus = s
    }
}

extension SyllableView {
    var body: some View {
        Text(syllableText).background(color)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView(syllables: b.syllables)
    }
}

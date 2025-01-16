//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Yogesh Raut on 16/01/25.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @State private var notes : [Notes] = [Notes] ()
    @State private var text : String = ""
    //MARK: - FUNCTIONS
    
    func save () {
        dump(notes)
    }
    
    //MARK: - BODY
    var body: some View {
        
            VStack {
                    HStack (alignment: .center, spacing: 6) {
                        TextField("Add New Notes", text: $text)
                        Button{
                            guard text.isEmpty == false else {return}
                            
                            let note = Notes(id: UUID(), text: text)
                            notes.append(note)
                            
                            text = ""
                            
                            save()
                            
                        } label: {
                            Image(systemName: "plus.circle")
                        }
                        .fixedSize()
                        .buttonStyle(PlainButtonStyle())
                        .foregroundColor(.accentColor)
                        .font(.system(size : 42, weight: .semibold))
                        //.buttonStyle(BorderedButtonStyle(tint: .accentColor))
                    } // :- HSTACK
                    
                    Spacer()
                Text("\(notes.count)")
            } // :- VSTACK
            .navigationTitle("Notes")
            
    }
}
  //MARK: - PREVIEWS
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

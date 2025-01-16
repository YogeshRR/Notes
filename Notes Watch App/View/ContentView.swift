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
    
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func save () {
        //dump(notes)
        do {
            let data = try JSONEncoder().encode(notes)
            let url = getDocumentDirectory().appendingPathComponent("notes")
            try data.write(to: url)
        } catch {
            print("Savings data failed")
        }
    }
    
    func deleteItem (offset : IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offset)
        }
    }
    
    func load()  {
        DispatchQueue.main.async {
            do {
                let url = getDocumentDirectory().appendingPathComponent("notes")
                let data = try Data(contentsOf: url)
                notes = try JSONDecoder().decode([Notes].self, from: data)
            }catch {
                // Do Nothing
            }
        }
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
                if notes.count >= 1 {
                    List {
                        
                        ForEach(0..<notes.count, id : \.self) { i in
                            HStack{
                                Capsule()
                                    .frame(width: 4)
                                    .foregroundColor(.accentColor)
                                Text(notes[i].text  )
                                    .lineLimit(1)
                                    .padding(.leading, 5)
                            }
                        }
                        .onDelete(perform: deleteItem)
                    }
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .opacity(0.35)
                    Spacer()
                } // :- LOOP
                
            } // :- VSTACK
            .navigationTitle("Notes")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                load()
            })
            
        }
}
  //MARK: - PREVIEWS
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

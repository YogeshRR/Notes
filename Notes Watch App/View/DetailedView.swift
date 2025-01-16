//
//  DetailedView.swift
//  Notes Watch App
//
//  Created by Yogesh Raut on 16/01/25.
//

import SwiftUI

struct DetailedView: View {
    //MARK: - PROPERTIES
    
    let note : Notes
    let count : Int
    let index : Int
    
    @State private var isCreditPresented : Bool = false
    
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
           
            HeaderView()
            Spacer()
            
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                Spacer()
            Text("\(count) / \(index + 1)")
                Spacer()
            Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditPresented, content: {
                        CreditsView()
                    } )
            } // :- HSTACK
            .foregroundColor(.accentColor)
        }
    }
}
 //MARK: - PREVIEWS
struct DetailedView_Previews: PreviewProvider {
    static var sampleData : Notes = Notes(id: UUID(), text: "Hello, World!")
    static var previews: some View {
        DetailedView(note: sampleData, count: 5, index: 1)
    }
}

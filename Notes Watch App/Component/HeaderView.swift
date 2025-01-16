//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by Yogesh Raut on 16/01/25.
//

import SwiftUI

struct HeaderView: View {
    //MARK: - PROPERTIES
    var title : String = ""
    //MARK: - BODY
    var body: some View {
        VStack {
            if (title != "") {
                Text(title.uppercased())
                    .foregroundColor(.accentColor)
                    .font(.title3)
                    .fontWeight(.bold)
            }
            HStack {
                Capsule()
                    .frame(height : 1)
                Image(systemName: "note.text")
                Capsule()
                    .frame(height : 1)
            } // :- HSTACK
            .foregroundColor(.accentColor)
        } // :- VSTACK
    }
}
  //MARK: - PREVIEWS
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(title: "Credits")
            HeaderView()
        }
    }
}

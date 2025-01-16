//
//  CreditsView.swift
//  Notes Watch App
//
//  Created by Yogesh Raut on 16/01/25.
//

import SwiftUI

struct CreditsView: View {
    //MARK: - PROPERTIES
    @State private var randomNumber : Int = Int.random(in: 0..<4)
    
    private var randomImage : String {
        return "developer-no\(randomNumber)"
    }
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
                
            
            HeaderView(title: "Credits")
            
            Text("Yogesh Raut")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        }
    }
}
  //MARK: - PREVIEWS
struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}

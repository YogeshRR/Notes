//
//  SettingsView.swift
//  Notes Watch App
//
//  Created by Yogesh Raut on 16/01/25.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - PROPERTIES
    @AppStorage("lineCount") var lineCount : Int = 1
    @State private var value : Float = 1.0
    
    //MARK: - FUNCTION
    
    func updateValue()  {
        lineCount = Int(value)
    }
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            HeaderView(title: "Settings")
            
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            Slider(value: Binding(get: {self.value}, set: {
                (newValue) in
                self.value = newValue
                self.updateValue()
            }), in: 1...4, step: 1)
                .foregroundColor(.accentColor)
        }
    }
}
   //MARK: - PREVIEWS
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

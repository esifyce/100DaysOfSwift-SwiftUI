//
//  ContentView.swift
//  WeSplit
//
//  Created by Sabir Myrzaev on 12/5/22.
//

import SwiftUI

struct ContentView: View {
    let student = ["Harry", "Tom", "Ellison"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(student, id: \.self) {
                        Text($0)
                    }
                }
            }.navigationTitle("WeSplit")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

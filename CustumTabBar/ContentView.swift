//
//  ContentView.swift
//  CustumTabBar
//
//  Created by Terry Kuo on 2021/3/25.
//

import SwiftUI

struct ContentView: View {
    
    let sf = ["pencil.circle","square.and.arrow.down.on.square","plus.app.fill","trash","person.badge.plus"]
    @State var isSelected = 0
    
    var body: some View {
        VStack {
            
            switch isSelected {
            case 0:
                NavigationView {
                    Text("Text")
                        .navigationTitle("First")
                }
            default:
                Text("Text Other")
            }
            
            
            Spacer()
            Divider()
            HStack {
                ForEach(0..<sf.count) { index in
                    Button(action: {
                        isSelected = index
                    }, label: {
                        Spacer()
                        Image(systemName: sf[index])
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                        Spacer()
                    })
                    
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

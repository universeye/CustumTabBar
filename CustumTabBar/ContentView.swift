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
    @State var shouldShowModel = false
    
    var body: some View {
        ZStack {
            
            Spacer()
                .fullScreenCover(isPresented: $shouldShowModel, content: {
                    Button(action: {
                        shouldShowModel = false
                    }, label: {
                        Text("Model Text")
                    })
                    
                })
            
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
                
                //Tab Bar
                HStack {
                    ForEach(0..<sf.count) { index in
                        Button(action: {
                            
                            if index == 2 {
                                shouldShowModel.toggle()
                            } else {
                                isSelected = index
                            }
                            
                        }, label: {
                            Spacer()
                            if index == 2 {
                                Image(systemName: sf[index])
                                    .font(.system(size: 35))
                                    .foregroundColor(.red)
                            } else if isSelected == index {
                                Image(systemName: sf[index])
                                    .font(.system(size: 25))
                                    .foregroundColor(.primary)
                            } else {
                                Image(systemName: sf[index])
                                    .font(.system(size: 25))
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        })
                        
                        
                    }
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

//
//  ContentView.swift
//  cw7 part2
//
//  Created by ghadeer almajed on 22/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State var tap = false
    
    var body: some View {
//        Text("Hello, world!")
//            .padding()
        
        VStack{
            Text("choose your major")
                .bold()
                .font(.largeTitle)
                .padding()
            Image(systemName: "plus")
                .font(.largeTitle)
                .padding()
                .background(.green)
                .clipShape(Circle())
                .onTapGesture {
                    tap.toggle()
                    
                }
            VStack{
                if tap{
                    Text("computer engineering")
                        .font(.largeTitle)
                        .padding()
                        .background(.yellow)
                        .cornerRadius(20)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 2)){
                                tap.toggle()
                      
                }
                  

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

//
//  ContentView.swift
//  Notes
//
//  Created by Himanshu on 19/10/23.
//

import SwiftUI

struct Preview_Provider:PreviewProvider{
    static var previews:some View{
        ContentView()
    }
}

struct ContentView:View{
    
    
    var body:some View{
        
        NavigationView{
            
            VStack{
                List{
                    VStack(alignment:.leading){
                        Text("Hii")
                        Text("Hello")
                        Text("My name is Himanshu.")
                    }}.listStyle(.plain)
                Spacer()
                
                 
                HStack{
                   
                    Button(action:{},
                           label:{Image(systemName:"folder.badge.plus")
                            .font(.system(size:29))
                            .foregroundColor(.yellow)
                    })
                        .padding(.trailing,300)
                    
                    
                    
                    Button(action:{
                        
                    },label:{
                        Image(systemName:"square.and.pencil")
                        
                            .font(.system(size:30))
                            .foregroundColor(.yellow)
                    })
                    
                }
            }
            
            
            
            .navigationTitle("Folders").bold()
            
            
            
        }
    }
}

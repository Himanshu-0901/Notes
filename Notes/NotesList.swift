
//  NotesList.swift
//  Notes
//
//  Created by Himanshu on 20/10/23.


import Foundation
import SwiftUI


struct NotesList:View{
    
    @AppStorage("mode") var isdark=false
    @Environment(\.managedObjectContext) var managedObj
    @FetchRequest(sortDescriptors:[SortDescriptor(\.date,order:.reverse)])
    var obj:FetchedResults<Note>
    
    @State private var bool=false
    @State var count:Int16=0
    @State private var searchobj:search=search()
    
    
    var body:some View{
        NavigationView{
            VStack{
                Form{
                    ForEach(obj){ obj in
                       Text(calcDay(date:obj.date!))
                           .bold()
                            
                            
            NavigationLink(destination:EditNotesView(obj:obj,count:$count)){
                 VStack(alignment:.leading){
                      Text("\((obj.title) ?? "")")
                      Text(calcDate(date:obj.date!))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                                
                        }
                }
                        
                    }
                    .onDelete(perform: deleteFood)
                }
                
                
                Spacer()
                
                HStack{
                    Text("\(obj.count) Notes")
                        .font(.system(size:14))
                        .offset(x:20,y:0)
                    
                    Button(action:{
                        bool.toggle()
                        },
                           label:{
                              Image(systemName:"square.and.pencil")
                                 .font(.system(size:30))
                                 .foregroundColor(.yellow)
                    })
                    .offset(x:120,y:0)
                    .sheet(isPresented: $bool){
                        AddNotesView(count:$count)
                    }
                    
                }
                
            }
            
            .searchable(text:$searchobj.query)
            .onChange(of: searchobj){
                newValue in
                obj.nsPredicate=searchfunc(newValue.query)
            }
           
            .navigationTitle("Notes")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing, content:{
                        Button(action:{isdark.toggle()},
                               label:{
                            Image(systemName:isdark ? "lightbulb.fill" : "lightbulb")
                        })})
               }
        }
        
     
        .environment(\.colorScheme, isdark ? .dark : .light)
        
    }
    
        private func deleteFood(offsets:IndexSet){
            count-=1
            withAnimation{
               offsets.map{obj[$0]}.forEach(managedObj.delete)
               DataController().save(context: managedObj)
        }
    }
}




// Structure for searching the notes. 

struct search:Equatable{
    var query=""
}

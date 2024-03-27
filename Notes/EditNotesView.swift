//
//  EditNotesView.swift
//  Notes
//
//  Created by Himanshu on 21/10/23.
//

import SwiftUI


struct EditNotesView:View{
    @Environment(\.managedObjectContext) var managedObj
    @Environment(\.dismiss) var dismiss
    var obj:FetchedResults<Note>.Element
    @Binding var count:Int16
    @State var notes=""
    @State var bul=false
     
    var body: some View{
        VStack{
            TextEditor(text:$notes)
                .font(.system(size:28))
                .padding()
                .onAppear{
                    notes=obj.note!
                }
            
            Spacer()
            HStack{
                Button(action:{
                    bul.toggle()
                },
                       label:{
                    Image(systemName:"square.and.pencil")
                        .font(.system(size:30))
                        .foregroundColor(.yellow)
                })
                .padding(.leading,310)
                .sheet(isPresented:$bul){
                    AddNotesView(count:$count)
                }
            }
            
        }
        .navigationBarItems(
            trailing:Button(action:{
                DataController()
                .editData(obj:obj,title:titleresult(note:notes),
                          note:notes,context:managedObj)
                },
                label:{
                  Text("Done")
                     .foregroundColor(.yellow)
            
                }))
    }
}
            
            

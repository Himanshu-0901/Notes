//
//  NotesView.swift
//  Notes
//
//  Created by Himanshu on 19/10/23.
//

import SwiftUI


struct AddNotesView: View {
    
    @Environment(\.managedObjectContext) var managedObj
    @Environment(\.dismiss) var dismiss
    @State var note=""
    @Binding var count:Int16
    
    var body: some View{
        NavigationView{
            
            
            TextEditor(text:$note)
                .font(.system(size:28))
                .padding()
            
            
            .toolbar{
                ToolbarItem(placement:.navigationBarTrailing){
                    Button(action:{
                        if note==""{
                            dismiss()
                        }
                        else{
                            count+=1
                            DataController().savedData(note: note,
                            title:titleresult(note:note), count: count
                            ,context: managedObj)
                            dismiss()
                        }
                    }
                           ,label:{
                        Text("Done")
                            .foregroundColor(.yellow)
                            .bold()
                    })}
                
                    ToolbarItem(placement: .navigationBarLeading){
                        Button(action:{
                            if note==""{
                                dismiss()
                            }
                            else{
                                count+=1
                                DataController().savedData(note:note,
                                title:titleresult(note:note),
                                count:count,context:managedObj)
                                dismiss()
                            }}
                               ,label:{
                                  Text("< Notes")
                                   .foregroundColor(.yellow).bold()})
                   }
            }
        }
    }
}




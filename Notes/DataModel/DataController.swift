//
//  DataController.swift
//  Notes
//
//  Created by Himanshu on 19/10/23.
//

import Foundation
import CoreData


class DataController:ObservableObject{
    
    let container=NSPersistentContainer(name:"Saved")
    
    init(){
        container.loadPersistentStores{
            description,error in
            if let _=error{
                print("Data doesn't saved")
            }
        }
    }
    
    func save(context:NSManagedObjectContext){
        
        do{
            try context.save()
            print("Data Saved")
        }
        catch{
            print("Error.")
        }
        
    }
    
    func savedData(note:String,title:String,count:Int16,context:NSManagedObjectContext){
        let obj=Note(context:context)
        obj.id=UUID()
        obj.count=count
        obj.title=title
        obj.note=note
        obj.date=Date()
      
       save(context:context)
    }
    func editData(obj:Note,title:String,note:String,context:NSManagedObjectContext){
        
        obj.date=Date()
        obj.title=title
        obj.note=note
        
        save(context: context)
    }
}



//
//  NotesApp.swift
//  Notes
//
//  Created by Himanshu on 19/10/23.
//

import SwiftUI

@main
struct NotesApp: App {
    @StateObject private var dataController=DataController()
    
    var body: some Scene {
        WindowGroup {
            NotesList()
                .environment(\.managedObjectContext,dataController.container.viewContext)
                
        }
    }
}

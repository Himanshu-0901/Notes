//
//  CalcDate.swift
//  Notes
//
//  Created by Himanshu on 20/10/23.
//

import Foundation


func calcDay(date:Date)->String{
    let minutes=Int(-date.timeIntervalSinceNow)/60
    let hours=minutes/60
    let days=hours/24
    
    if minutes<=120{
        return " \(minutes) min ago"
    }
    else if hours<=24{
        return "\(hours) hr ago"
    }
    return "\(days) day ago"
}

func calcDate(date:Date)->String{
    let dateFormatter=DateFormatter()
    dateFormatter.dateFormat="MMM d,yyyy"
    return "\(dateFormatter.string(from: date))"
    
}





func titleresult(note:String)->String{
    if note.count<=10{
        return note
    }
    var a=""
    var j=1
    for i in note{
        if j<=10{
            a+=String(i)
            j+=1
        }
    }
    return "\(a)...."
}




//func search(_ query:String)->NSPredicate{
//        query.isEmpty ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", query)
//        
//}

func searchfunc(_ query:String)->NSPredicate{
    query.isEmpty ? NSPredicate(value:true) : NSPredicate(format: "title CONTAINS[cd] %@", query)
}

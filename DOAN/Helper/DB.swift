//
//  DB.swift
//  DOAN
//
//  Created by T.A Savvycom on 9/6/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import Foundation
import CoreData

class DB {
    static var MOC: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let moc = managedObjectContext
        return moc
    }
    
    static func save() {
        do {
            try MOC.save()
        } catch let error as NSError {
            print("Cannot save db: \(error)")
        }
    }
}

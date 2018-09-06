//
//  Product+CoreDataClass.swift
//  DOAN
//
//  Created by Tuan Anh on 8/29/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Product)
public class Product: NSManagedObject {
    
    // tạo mới một đối tượng để chèn vào CSDL
    static let className = "Product"
    
    static func createNew() -> NSManagedObject {
        
        return NSEntityDescription.insertNewObject(forEntityName: className, into: DB.MOC)
    }
    
    static func getAll() -> [NSManagedObject] {
        let fetchRequest: NSFetchRequest<NSManagedObject> = NSFetchRequest(entityName: className)
        
        do {
            let list = try DB.MOC.fetch(fetchRequest as! NSFetchRequest<NSFetchRequestResult>) as! [NSManagedObject]
            return list
        } catch let error as NSError {
            print("cannot fetch all : \(error)")
        }
        return [] // mang rong
    }
    
    
//    static func insertNewObject() -> NSManagedObject {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: className)
//        var idDescriptor: NSSortDescriptor = NSSortDescriptor(key: "id", ascending: false)
//        fetchRequest.sortDescriptors = [idDescriptor]
//        
//        fetchRequest.fetchLimit = 1
//        
//        var newId = 0
//        
//        do {
//            let results = try self.managedObjectContext.executeFetchRequest(fetchRequest)
//            
//            //Compute the id
//            if (results.count == 1) {
//            newId = results[0].id + 1 // slightly odd notation here, .id can be used if you use custom model. or you can use .valueForKey("id")
//            }
//            else { newId = 1 }
//            
//        } catch {
//            let fetchError = error as NSError
//            print(fetchError)
//        }
//        
//    }
    
    
}


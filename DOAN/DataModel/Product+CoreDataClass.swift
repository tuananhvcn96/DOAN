//
//  Product+CoreDataClass.swift
//  DOAN
//
//  Created by T.A Savvycom on 9/7/18.
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
}

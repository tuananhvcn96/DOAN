//
//  QueryData.swift
//  DOAN
//
//  Created by Tuan Anh on 8/29/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import Foundation
import CoreData

class QueryDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    init(persistentContainer: NSPersistentContainer) {
        self.persistentContainer = persistentContainer
    }
    
    func allContact() -> [LoaiSanPham] {
        do {
            let contacts = try self.persistentContainer.viewContext.fetch(NSFetchRequest(entityName: "Product")) as! [LoaiSanPham]
            return contacts
        } catch {
            print("Error fecthing contacs")
        }
        return []
    }
    
    func saveContext () {
        let context = persistentContainer.viewContext
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

//
//  Product+CoreDataProperties.swift
//  DOAN
//
//  Created by T.A Savvycom on 9/7/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var hinhanh: NSData?
    @NSManaged public var ma_sp: Int32
    @NSManaged public var tensp: String?
    @NSManaged public var mota: String?

}

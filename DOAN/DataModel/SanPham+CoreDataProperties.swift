//
//  SanPham+CoreDataProperties.swift
//  DOAN
//
//  Created by T.A Savvycom on 9/7/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//
//

import Foundation
import CoreData


extension SanPham {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SanPham> {
        return NSFetchRequest<SanPham>(entityName: "SanPham")
    }

    @NSManaged public var danhgia: String?
    @NSManaged public var giaban: Int32
    @NSManaged public var gianhap: Int32
    @NSManaged public var hinhanh: NSData?
    @NSManaged public var idsp: Int32
    @NSManaged public var masp: Int32
    @NSManaged public var tensp: String?

}

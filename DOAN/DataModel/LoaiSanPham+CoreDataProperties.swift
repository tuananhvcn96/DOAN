//
//  LoaiSanPham+CoreDataProperties.swift
//  DOAN
//
//  Created by T.A Savvycom on 9/10/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//
//

import Foundation
import CoreData


extension LoaiSanPham {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LoaiSanPham> {
        return NSFetchRequest<LoaiSanPham>(entityName: "LoaiSanPham")
    }

    @NSManaged public var hinhanh: NSData?
    @NSManaged public var ma_sp: Int32
    @NSManaged public var mota: String?
    @NSManaged public var tensp: String?
    @NSManaged public var id: Int32
    @NSManaged public var sanpham: SanPham?

}

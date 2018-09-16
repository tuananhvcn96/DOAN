//
//  QueryLoaiSpModel.swift
//  DOAN
//
//  Created by Tuan Anh on 9/15/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import Foundation
import UIKit

let sharedInstance = QueryLoaiSpModel()

class QueryLoaiSpModel : NSObject {
    
    var database: FMDatabase? = nil
    
    class func getInstance() -> QueryLoaiSpModel{
        if (sharedInstance.database == nil){
            sharedInstance.database = FMDatabase(path: Util.getPath(fileName: "shopbanh.db"))
        }
        return sharedInstance
    }
        
    // "INSERT INTO Info(Name,MobileNo,Email) VALUES(?,?,?)"  [Tbl_Info.Name,Tbl_Info.MobileNo,Tbl_Info.Email]
    // Mark: Insert data into table
    
    func insertData(_ loaisp: loaiSanPham) -> Bool {
        sharedInstance.database!.open()
        let isInserted = sharedInstance.database!.executeUpdate("INSERT INTO LoaiSanPham(tensp,motasp,hinhanh) VALUES (?,?,?)",
                                                                withArgumentsIn: [loaisp.tensp,loaisp.motasp,UIImagePNGRepresentation(loaisp.hinhanh)!])
    }
    
}



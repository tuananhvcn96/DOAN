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
            sharedInstance.database = FMDatabase(path: Util.getPath(fileName: "shopping.db"))
        }
        return sharedInstance
    }
        
    // "INSERT INTO Info(Name,MobileNo,Email) VALUES(?,?,?)"  [Tbl_Info.Name,Tbl_Info.MobileNo,Tbl_Info.Email]
    // Mark: Insert data into table
    
    func insertData(_ loaisp: loaiSanPham) -> Bool {
        sharedInstance.database!.open()
        let isInserted = sharedInstance.database!.executeUpdate("INSERT INTO LoaiSanPham(tensanpham,motasanpham,hinhanh) VALUES (?,?,?)",
                                                                withArgumentsIn: [loaisp.tensp,loaisp.motasp,loaisp.hinhanh])
        
        sharedInstance.database!.close()
        return isInserted
    }
    
    func insertDataProduct(_ product: SanPhamm) -> Bool {
        sharedInstance.database!.open()
        
        let relustSet = sharedInstance.database!.executeUpdate("INSERT INTO SanPham (id,tensanpham, motasanpham,ghichu,danhgia,giaban,gianhap,hinhanh) VALUES (?,?,?,?,?,?,?,?)", withArgumentsIn: [product.id,product.tensanpham,product.motasanpham,product.ghichu,product.danhgia,product.giaban,product.gianhap,product.hinhanh])
        
        sharedInstance.database!.close()
        return relustSet
    }
    
    func getAllData() -> [loaiSanPham] {
        sharedInstance.database!.open()
        
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM LoaiSanPham", withArgumentsIn: [0])
        
        var itemProduct: [loaiSanPham] = []
        if (resultSet != nil) {
            while resultSet.next() {
                let item: loaiSanPham = loaiSanPham()
                item.id_loaisp = Int(resultSet.int(forColumn: "id"))
                item.tensp = String(resultSet.string(forColumn: "tensanpham")!)
                item.motasp = String(resultSet.string(forColumn: "motasanpham")!)
                item.hinhanh = Data(resultSet.data(forColumn: "hinhanh")!)
                itemProduct.append(item)
            }
        }
        sharedInstance.database!.close()
        return itemProduct
    }
    
    func getAllDataProduct() -> [SanPhamm] {
        sharedInstance.database!.open()
        
        let resultProduct: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM SanPham", withArgumentsIn: [0])
        
        var itemProduct: [SanPhamm] = []
        if (resultProduct != nil) {
            while resultProduct.next() {
                let item: SanPhamm = SanPhamm()
                item.idsanpham = Int(resultProduct.int(forColumn: "idsanpham"))
                item.tensanpham = String(resultProduct.string(forColumn: "tensanpham")!)
                item.motasanpham = String(resultProduct.string(forColumn: "motasanpham")!)
                item.ghichu = String(resultProduct.string(forColumn: "ghichu")!)
                item.danhgia = String(resultProduct.string(forColumn: "danhgia")!)
                item.giaban = String(resultProduct.string(forColumn: "giaban")!)
                item.gianhap = String(resultProduct.string(forColumn: "gianhap")!)
                item.hinhanh = Data(resultProduct.data(forColumn: "hinhanh")!)
                itemProduct.append(item)
            }
        }
        sharedInstance.database!.close()
        return itemProduct
    }
    
    
}



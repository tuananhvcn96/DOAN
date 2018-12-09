//
//  QueryLoaiSpModel.swift
//  DOAN
//
//  Created by Tuan Anh on 9/15/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//


import UIKit
import FMDB

let sharedInstance = QueryDatabaseModel()

class QueryDatabaseModel : NSObject {
    
    var database: FMDatabase? = nil
    
    class func getInstance() -> QueryDatabaseModel{
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
    
    func insertUser(_ user: User) -> Bool {
        sharedInstance.database!.open()
        let isInserted = sharedInstance.database!.executeUpdate("INSERT INTO User(iduser,name,username,password,email) VALUES (?,?,?,?,?)",
                                                                withArgumentsIn: [user.iduser,user.name,user.username,user.password,user.email])
        
        sharedInstance.database!.close()
        return isInserted
    }
    
    func insertDataProduct(_ product: SanPhamm) -> Bool {
        sharedInstance.database!.open()
        
        let relustSet = sharedInstance.database!.executeUpdate("INSERT INTO SanPham (id,tensanpham, motasanpham,ghichu,danhgia,giaban,gianhap,hinhanh) VALUES (?,?,?,?,?,?,?,?)", withArgumentsIn: [product.id,product.tensanpham,product.motasanpham,product.ghichu,product.danhgia,product.giaban,product.gianhap,product.hinhanh])
        
        sharedInstance.database!.close()
        return relustSet
    }
    
    func insertCart(_ cart: Cart) -> Bool {
        sharedInstance.database!.open()
        
        let relustSet = sharedInstance.database!.executeUpdate("INSERT INTO Cart (tensp,motasp,giatien,soluong,hinhanh) VALUES (?,?,?,?,?)", withArgumentsIn: [cart.tensp,cart.motasp,cart.giatien,cart.soluong,cart.hinhanh])
        
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
    
    func getAllUser() -> [User] {
        sharedInstance.database!.open()
        
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM User", withArgumentsIn: [0])
        
        var itemUser: [User] = []
        if (resultSet != nil) {
            while resultSet.next() {
                let item: User = User()
                item.iduser = Int(resultSet.int(forColumn: "iduser"))
                item.name = String(resultSet.string(forColumn: "name")!)
                item.username = String(resultSet.string(forColumn: "username")!)
                item.password = String(resultSet.string(forColumn: "password")!)
                item.email = String(resultSet.string(forColumn: "email")!)
                itemUser.append(item)
            }
        }
        sharedInstance.database!.close()
        return itemUser
    }
    
    func getAllCart() -> [Cart] {
        sharedInstance.database!.open()
        
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM Cart", withArgumentsIn: [0])
        
        var itemCart: [Cart] = []
        if (resultSet != nil) {
            while resultSet.next() {
                let item: Cart = Cart()
                item.id = Int(resultSet.int(forColumn: "id"))
                item.tensp = String(resultSet.string(forColumn: "tensp")!)
                item.giatien = Int(resultSet.int(forColumn: "giatien"))
                item.motasp = String(resultSet.string(forColumn: "motasp")!)
                item.soluong = Int(resultSet.int(forColumn: "soluong"))
                item.hinhanh = Data(resultSet.data(forColumn: "hinhanh")!)
                itemCart.append(item)
            }
        }
        sharedInstance.database!.close()
        return itemCart
    }
    
    func getAllDataProduct(id: Int) -> [SanPhamm] {
        sharedInstance.database!.open()
        
        let resultProduct: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM SanPham WHERE id = \(id)", withArgumentsIn: [0])
        
        var itemProduct: [SanPhamm] = []
        if (resultProduct != nil) {
            while resultProduct.next() {
                let item: SanPhamm = SanPhamm()
                item.idsanpham = Int(resultProduct.int(forColumn: "idsanpham"))
                item.id = Int(resultProduct.int(forColumn: "id"))
                item.tensanpham = String(resultProduct.string(forColumn: "tensanpham")!)
                item.motasanpham = String(resultProduct.string(forColumn: "motasanpham")!)
                item.ghichu = String(resultProduct.string(forColumn: "ghichu")!)
                item.danhgia = String(resultProduct.string(forColumn: "danhgia")!)
                item.giaban = Int(resultProduct.int(forColumn: "giaban"))
                item.gianhap = Int(resultProduct.int(forColumn: "gianhap"))
                item.hinhanh = Data(resultProduct.data(forColumn: "hinhanh")!)
                itemProduct.append(item)
            }
        }
        sharedInstance.database!.close()
        return itemProduct
    }
    
    func updateCart(RecoreId: Int, soluong: Int) -> NSMutableArray {
        sharedInstance.database!.open()
        
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("UPDATE Cart SET soluong = ? WHERE id = ?", withArgumentsIn: [soluong,RecoreId])
        
        let itemInfo: NSMutableArray = NSMutableArray()
        if (resultSet != nil) {
            while resultSet.next() {
                let item: Cart = Cart()
                item.id = Int(resultSet.int(forColumn: "id"))
                item.soluong = Int(resultSet.int(forColumn: "soluong"))
                itemInfo.add(item)
            }
        }
        
        sharedInstance.database!.close()
        return itemInfo
    }
    
    func updateCartCell(id: Int, soluong: Int) -> NSMutableArray {
        sharedInstance.database!.open()
        
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("UPDATE Cart SET soluong = ? WHERE id = ?", withArgumentsIn: [soluong,id])
        
        let itemInfo: NSMutableArray = NSMutableArray()
        if (resultSet != nil) {
            while resultSet.next() {
                let item: Cart = Cart()
                item.id = Int(resultSet.int(forColumn: "id"))
                item.soluong = Int(resultSet.int(forColumn: "soluong"))
                itemInfo.add(item)
            }
        }
        
        sharedInstance.database!.close()
        return itemInfo
    }
    
    func deleteCart(RecoreId: Int) -> NSMutableArray {
        sharedInstance.database?.open()
        
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("DELETE FROM Cart WHERE id = ?", withArgumentsIn: [RecoreId])
        
        let itemInfo: NSMutableArray = NSMutableArray()
        if (resultSet != nil) {
            while resultSet.next() {
                let item: Cart = Cart()
                item.id = Int(resultSet.int(forColumn: "id"))
                item.tensp = String(resultSet.string(forColumn: "tensp")!)
                item.motasp = String(resultSet.string(forColumn: "motasp")!)
                item.soluong = Int(resultSet.int(forColumn: "soluong"))
                item.giatien = Int(resultSet.int(forColumn: "giatien"))
                item.hinhanh = Data(resultSet.data(forColumn: "hinhanh")!)
                itemInfo.add(item)
            }
        }
        
        sharedInstance.database!.close()
        return itemInfo
    }
}



//
//  classModel.swift
//  testBranchNew
//
//  Created by Nobby on 23/11/18.
//  Copyright © 2018 Nobby. All rights reserved.
//

import Foundation

class classModel
{
    
    public var id:String?
    public var name:String?
    public var address:String?
    public var state:String?
    
    var loadMainData : (() -> Void) =  {}
  
    
    init(with data:[String:String])
    {
        self.id = data["id"]
        self.name = data["name"]
        self.address = data["address"]
        self.state = data["state"]
    }

    
  
    

}

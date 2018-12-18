//
//  ClassMainModel.swift
//  testBranchNew
//
//  Created by Nobby on 24/11/18.
//  Copyright © 2018 Nobby. All rights reserved.
//

import UIKit

class ClassMainModel: NSObject
{
    var loadMainData : ((_ errormessage:String,_ data:[String:Any]) -> Void) =  {_,_ in}

    func loadData(arr:[String:Any])
    {
        self.loadMainData("sample message",arr)
    }
    
}

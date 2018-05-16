//
//  Result .swift
//  Marvel Universe
//
//  Created by Omar  on 16/05/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failure(Error)
}


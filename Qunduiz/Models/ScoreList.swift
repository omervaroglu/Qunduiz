//
//  Score.swift
//  Qunduiz
//
//  Created by Ömer Varoğlu on 16.05.2019.
//  Copyright © 2019 Omer Varoglu. All rights reserved.
//

import Foundation
import ObjectMapper

public class ScoreList : NSObject{
    var score : Int
    var name : String
    
    init(name:String, score:Int ) {
        self.name = name
        self.score = score
    }

}

//
//  Scores.swift
//  Qunduiz
//
//  Created by Ömer Varoğlu on 16.05.2019.
//  Copyright © 2019 Omer Varoglu. All rights reserved.
//

import Foundation
import ObjectMapper

struct Scores: Mappable {
    var score : [Score]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        score <- map["Score"]
    }
    
}

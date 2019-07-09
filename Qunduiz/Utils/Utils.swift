//
//  Utils.swift
//  MovieGuide
//
//  Created by Omer  on 25.02.2019.
//  Copyright © 2019 Omer Varoglu. All rights reserved.
//

import Foundation

class Utils {
    static var questions : [Questions] = []
    
//    static func printResponse(response: DataResponse<Any>){
//        print("\n\n >>Response : (\(response.request?.url!.relativePath ?? ""))")
//        //print(response.request!)  // original URL request
//        print(response.response ?? "response.response nil") // URL response
//        print(" >>Response Time : "+response.timeline.totalDuration.description)     // server data
//        print(" >>Result : ")
//        print(response.result)   // result of response serialization
//        print(response.result.value ?? "response.result.value yazılamadı.")
//        print("\n\n")
//    }
    
    static func getAuthorizationKey() -> String {
        return UserDefaults.standard.string(forKey: "registrationSecret") ?? ""
    }
    
    static func setSelected(_ qeustionList: [Questions]) -> [Questions] {
        var q = qeustionList
        for section in q.indices {
            for number in q[section].answers.indices{
                if q[section].answers[number].isSelected {
                    q[section].answers[number].isSelected = false
                    return q
                }
                return questions
            }
        }
        return questions
    }
}

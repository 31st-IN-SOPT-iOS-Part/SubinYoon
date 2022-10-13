//
//  getClassName.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/13.
//

import UIKit

extension NSObject {
  
    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
     var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
}

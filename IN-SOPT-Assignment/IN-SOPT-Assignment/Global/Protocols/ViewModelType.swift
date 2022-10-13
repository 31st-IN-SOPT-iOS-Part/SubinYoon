//
//  ViewModelType.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/13.
//

import Foundation

protocol ViewModelType{
    associatedtype Input
    associatedtype Output
    
    func transform(from input: Input) -> Output
}

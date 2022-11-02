//
//  FriendsModel.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/31.
//

import UIKit

struct FriendsModel {
    var profileImage: UIImage = ImageLiterals.profileImgSample
    var userName: String = "빙수윤"
    var caption: String?
}

extension FriendsModel {
    static var sampleData: [FriendsModel] {
        return [
            FriendsModel(profileImage: ImageLiterals.profileImg1, userName: "김솝트", caption: "안녕하세요"),
            FriendsModel(profileImage: ImageLiterals.profileImg2, userName: "이솝트", caption: "행복하세요"),
            FriendsModel(profileImage: ImageLiterals.profileImg3, userName: "박솝트", caption: nil),
            FriendsModel(profileImage: ImageLiterals.profileImg4, userName: "최솝트", caption: "반갑습니다"),
            FriendsModel(profileImage: ImageLiterals.profileImg5, userName: "정솝트", caption: nil),
            FriendsModel(profileImage: ImageLiterals.profileImg6, userName: "강솝트", caption: "시크릿쥬쥬 리미티드 에디션"),
            FriendsModel(profileImage: ImageLiterals.profileImg7, userName: "조솝트", caption: nil),
            FriendsModel(profileImage: ImageLiterals.profileImg8, userName: "윤솝트", caption: "건강합시다"),
            FriendsModel(profileImage: ImageLiterals.profileImg9, userName: "장솝트", caption: nil),
            FriendsModel(profileImage: ImageLiterals.profileImg1, userName: "김솝트", caption: "쿠쿠루삥뽕"),
            FriendsModel(profileImage: ImageLiterals.profileImg2, userName: "이솝트", caption: "인절미빙수"),
            FriendsModel(profileImage: ImageLiterals.profileImg3, userName: "박솝트", caption: nil),
            FriendsModel(profileImage: ImageLiterals.profileImg4, userName: "최솝트", caption: "아자아자 화이자"),
            FriendsModel(profileImage: ImageLiterals.profileImg5, userName: "정솝트", caption: "미리 메리 크리스마스")
        ]
    }
}

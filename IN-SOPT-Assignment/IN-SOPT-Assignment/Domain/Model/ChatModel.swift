//
//  ChatModel.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/11/02.
//

import UIKit

struct ChatModel {
    var profileImage: UIImage
    var userName, message, time: String
}

extension ChatModel {
    static var sampleData: [ChatModel] {
        return [
            ChatModel(profileImage: ImageLiterals.profileImg1, userName: "김솝트", message: "메시지좀 봐줄래?", time: "2022-11-03 16:30"),
            ChatModel(profileImage: ImageLiterals.profileImg2, userName: "이솝트", message: "선물과 메시지를 보냈습니다.", time: "2022-11-06 15:20"),
            ChatModel(profileImage: ImageLiterals.profileImg3, userName: "박솝트", message: "자니?", time: "2022-11-06 01:00"),
            ChatModel(profileImage: ImageLiterals.profileImg4, userName: "최솝트", message: "안녕 오랜만이야.", time: "2022-10-30 13:45"),
            ChatModel(profileImage: ImageLiterals.profileImg5, userName: "정솝트", message: "이번주 토요일에 뭐해?", time: "2022-11-01 16:30"),
            ChatModel(profileImage: ImageLiterals.profileImg6, userName: "강솝트", message: "넵", time: "2022-10-31 19:00"),
            ChatModel(profileImage: ImageLiterals.profileImg7, userName: "조솝트", message: "ㅇㅋㅇㅋ", time: "2022-11-04 09:00"),
            ChatModel(profileImage: ImageLiterals.profileImg8, userName: "윤솝트", message: "과제 다했어?", time: "2022-11-05 12:30"),
            ChatModel(profileImage: ImageLiterals.profileImg9, userName: "장솝트", message: "어디야?", time: "2022-11-06 11:30"),
            ChatModel(profileImage: ImageLiterals.profileImgSample, userName: "임솝트", message: "안녕하세요.", time: "2022-11-06 10:00"),
            ChatModel(profileImage: ImageLiterals.profileImgSample, userName: "한솝트", message: "ㅋㅋㅋㅋ", time: "2022-10-31 14:40"),
            ChatModel(profileImage: ImageLiterals.profileImgSample, userName: "오솝트", message: "저녁 뭐드실?", time: "2022-11-03 17:50"),
            ChatModel(profileImage: ImageLiterals.profileImgSample, userName: "서솝트", message: "안잠?", time: "2022-11-02 03:30")
        ]
    }
}

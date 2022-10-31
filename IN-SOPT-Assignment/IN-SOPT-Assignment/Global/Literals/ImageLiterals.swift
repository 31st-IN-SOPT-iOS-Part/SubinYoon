//
//  ImageLiterals.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/13.
//

import UIKit

enum ImageLiterals {
    
    static var profileImgSample: UIImage { .load(named: "friendtabProfileImg") }
    
    static var profileImg1: UIImage { .load(named: "profileImage1") }
    static var profileImg2: UIImage { .load(named: "profileImage2") }
    static var profileImg3: UIImage { .load(named: "profileImage3") }
    static var profileImg4: UIImage { .load(named: "profileImage4") }
    static var profileImg5: UIImage { .load(named: "profileImage5") }
    static var profileImg6: UIImage { .load(named: "profileImage6") }
    static var profileImg7: UIImage { .load(named: "profileImage7") }
    static var profileImg8: UIImage { .load(named: "profileImage8") }
    static var profileImg9: UIImage { .load(named: "profileImage9") }
    
    static var settingIcn: UIImage { .load(named: "friendtabSettings") }
    static var closeIcn: UIImage { .load(named: "profileCloseBtn") }
    static var editIcn: UIImage { .load(named: "profileEditImg") }
    static var storyIcn: UIImage { .load(named: "profileStoryImg") }
    static var talkIcn: UIImage { .load(named: "profileTalkImg") }
    static var plusIcn: UIImage { .load(named: "iconPlus") }
    
    static var friendTabIcn: UIImage { .load(named: "friendTabIcon") }
    static var friendTabIcnSelected: UIImage { .load(named: "friendTabIcon_selected") }
    static var chatTabIcn: UIImage { .load(named: "messageTabIcon") }
    static var chatTabIcnSelected: UIImage { .load(named: "messageTabIcon_selected") }
    static var searchTabIcn: UIImage { .load(named: "searchTabIcon") }
    static var searchTabIcnSelected: UIImage { .load(named: "searchTabIcon_selected") }
    static var shopTabIcn: UIImage { .load(named: "shopTabIcon") }
    static var shopTabIcnSelected: UIImage { .load(named: "shopTabIcon_selected") }
    static var settingTabIcn: UIImage { .load(named: "detailTabIcon") }
    static var settingTabIcnSelected: UIImage { .load(named: "detailTabIcon_selected") }
}

extension UIImage {
    static func load(named imageName: String) -> UIImage {
        guard let image = UIImage(named: imageName, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = imageName
        return image
    }
    
    func resize(to size: CGSize) -> UIImage {
        let image = UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
        return image
    }
}

//
//  ImageLiterals.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/13.
//

import UIKit

enum ImageLiterals {
    
    static var profileImgSample: UIImage { .load(named: "friendtabProfileImg") }
    static var subinImage: UIImage { .load(named: "SubinImage")}
    
    static var profileImg1: UIImage { .load(named: "profileImage1") }
    static var profileImg2: UIImage { .load(named: "profileImage2") }
    static var profileImg3: UIImage { .load(named: "profileImage3") }
    static var profileImg4: UIImage { .load(named: "profileImage4") }
    static var profileImg5: UIImage { .load(named: "profileImage5") }
    static var profileImg6: UIImage { .load(named: "profileImage6") }
    static var profileImg7: UIImage { .load(named: "profileImage7") }
    static var profileImg8: UIImage { .load(named: "profileImage8") }
    static var profileImg9: UIImage { .load(named: "profileImage9") }
    
    static var galleryImage1: UIImage { .load(named: "galleryImage1") }
    static var galleryImage2: UIImage { .load(named: "galleryImage2") }
    static var galleryImage3: UIImage { .load(named: "galleryImage3") }
    static var galleryImage4: UIImage { .load(named: "galleryImage4") }
    static var galleryImage5: UIImage { .load(named: "galleryImage5") }
    static var galleryImage6: UIImage { .load(named: "galleryImage6") }
    static var galleryImage7: UIImage { .load(named: "galleryImage7") }
    static var galleryImage8: UIImage { .load(named: "galleryImage8") }
    static var galleryImage9: UIImage { .load(named: "galleryImage9") }
    static var galleryImage10: UIImage { .load(named: "galleryImage10") }
    static var galleryImage11: UIImage { .load(named: "galleryImage11") }
    static var galleryImage12: UIImage { .load(named: "galleryImage12") }
    static var galleryImage13: UIImage { .load(named: "galleryImage13") }
    static var galleryImage14: UIImage { .load(named: "galleryImage14") }
    static var galleryImage15: UIImage { .load(named: "galleryImage15") }
    static var galleryImage16: UIImage { .load(named: "galleryImage16") }
    static var galleryImage17: UIImage { .load(named: "galleryImage17") }
    static var galleryImage18: UIImage { .load(named: "galleryImage18") }
    static var galleryImage19: UIImage { .load(named: "galleryImage19") }
    static var galleryImage20: UIImage { .load(named: "galleryImage20") }
    static var galleryImage21: UIImage { .load(named: "galleryImage21") }
    static var galleryImage22: UIImage { .load(named: "galleryImage22") }
    static var galleryImage23: UIImage { .load(named: "galleryImage23") }
    
    static var settingIcn: UIImage { .load(named: "friendtabSettings") }
    static var closeIcn: UIImage { .load(named: "profileCloseBtn") }
    static var editIcn: UIImage { .load(named: "profileEditImg") }
    static var storyIcn: UIImage { .load(named: "profileStoryImg") }
    static var talkIcn: UIImage { .load(named: "profileTalkImg") }
    static var plusIcn: UIImage { .load(named: "iconPlus") }
    static var cameraIcn: UIImage { .load(named: "iconCamera") }
    
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

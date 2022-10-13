//
//  ImageLiterals.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/13.
//

import UIKit

enum ImageLiterals {
    
    static var profileImg: UIImage { .load(named: "friendtabProfileImg") }
    static var settingIcn: UIImage { .load(named: "friendtabSettings") }
    static var closeIcn: UIImage { .load(named: "profileCloseBtn") }
    static var editIcn: UIImage { .load(named: "profileEditImg") }
    static var storyIcn: UIImage { .load(named: "profileStoryImg") }
    static var talkIcn: UIImage { .load(named: "profileTalkImg") }
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

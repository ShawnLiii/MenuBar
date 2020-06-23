//
//  MenuOptions.swift
//  MenuBar
//
//  Created by Shawn Li on 6/1/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit


enum MenuOptions: String, CaseIterable
{
    case characters = "Characters"
    case comics = "Hero Comics"
    case events = "Hero Events"
    case series = "Hero Series"
    case stories = "Hero Stories"
    case logout = "Log Out"
    
    var iconImage: UIImage
    {
        switch self
        {
        case .characters:
            return UIImage(systemName: "person.fill") ?? UIImage()
        case .comics:
            return UIImage(systemName: "book.fill") ?? UIImage()
        case .events:
            return UIImage(systemName: "doc.fill") ?? UIImage()
        case .series:
            return UIImage(systemName: "star.fill") ?? UIImage()
        case .stories:
            return UIImage(systemName: "bookmark.fill") ?? UIImage()
        case .logout:
            return UIImage(systemName: "arrowshape.turn.up.left.fill") ?? UIImage()
        }
    }
}

//
//  Patient.swift
//  IsCleanSwiftClean
//
//  Created by Jordan Rilassi on 13/09/2019.
//  Copyright © 2019 Jordan. All rights reserved.
//

import UIKit

enum Gender {
    case male
    case female

    var image: UIImage {
        switch self {
        case .male: return UIImage(named: "avatar-icon-man")!
        case .female: return UIImage(named: "avatar-icon-woman")!
        }
    }
}

struct Patient {
    var id: String
    var firstName: String
    var lastName: String
    var gender: Gender
}

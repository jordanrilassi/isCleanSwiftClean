// Copyright (C) SNAL, Inc - All Rights Reserved
// Unauthorized copying of this file, via any medium is strictly prohibited
// Proprietary and confidential
// Created by Jordan Rilassi on 13/09/2019.

import UIKit

enum PatientDetail {
    // MARK: Use cases
    
    enum PatientDetail {
        struct Request {
        }
        struct Response {
            let firstName: String
            let lastName: String
            let gender: Gender
        }
        struct ViewModel {
            let fullName: String
            let image: UIImage
        }
    }
}

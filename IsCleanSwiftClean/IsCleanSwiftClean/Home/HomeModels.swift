// Copyright (C) SNAL, Inc - All Rights Reserved
// Unauthorized copying of this file, via any medium is strictly prohibited
// Proprietary and confidential
// Created by Jordan Rilassi on 13/09/2019.

import UIKit

enum Home {
    // MARK: Use cases
    
    enum Patients {
        struct Request {
        }
        struct Response {
            let patients: [Patient]
        }
        struct ViewModel {
            let patients: [Patient]
        }
    }

    enum Select {
        struct Request {
            let patientId: String
        }
        struct Response {
        }
        struct ViewModel {
        }
    }
}

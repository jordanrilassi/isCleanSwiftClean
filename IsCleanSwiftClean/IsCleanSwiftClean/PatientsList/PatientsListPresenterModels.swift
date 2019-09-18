// Copyright (C) SNAL, Inc - All Rights Reserved
// Unauthorized copying of this file, via any medium is strictly prohibited
// Proprietary and confidential
// Created by Jordan Rilassi on 13/09/2019.

import UIKit

enum PatientsList {
    // MARK: Use cases
    
    enum Patients {
        struct Request {
        }
        struct Response {
            let patients: [Patient]
        }
        struct ViewModel {
            struct PatientModel {
                let id: String
                let fullName: String
            }
            let patientModels: [PatientModel]
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

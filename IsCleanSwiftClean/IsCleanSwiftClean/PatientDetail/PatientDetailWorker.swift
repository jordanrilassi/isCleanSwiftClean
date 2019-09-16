// Copyright (C) SNAL, Inc - All Rights Reserved
// Unauthorized copying of this file, via any medium is strictly prohibited
// Proprietary and confidential
// Created by Jordan Rilassi on 13/09/2019.

import UIKit

class PatientDetailWorker {
    func fetchPatient(with patientId: String) -> Patient? {
        return PatientDBRepository().fetchPatient(with: patientId)
    }
}

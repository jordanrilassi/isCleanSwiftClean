// Copyright (C) SNAL, Inc - All Rights Reserved
// Unauthorized copying of this file, via any medium is strictly prohibited
// Proprietary and confidential
// Created by Jordan Rilassi on 13/09/2019.

import UIKit

class PatientsListWorker {
    func fetchPatients() -> PatientsList.Patients.Response {
        let patients = PatientDBRepository().fetchPatients()
        let response = PatientsList.Patients.Response(patients: patients)
        return response
    }
}

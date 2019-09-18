// Copyright (C) SNAL, Inc - All Rights Reserved
// Unauthorized copying of this file, via any medium is strictly prohibited
// Proprietary and confidential
// Created by Jordan Rilassi on 13/09/2019.

import UIKit

protocol PatientsListBusinessLogic {
    func fetchPatients(request: PatientsList.Patients.Request)
    func selectPatient(request: PatientsList.Select.Request)
}

protocol PatientsListDataStore {
    var patientId: String { get set }
}

class PatientsListInteractor: PatientsListBusinessLogic, PatientsListDataStore {
    var presenter: PatientsListPresentationLogic?
    var worker: PatientsListWorker?

    var patientId: String = ""

    // MARK: Fetch form
    
    func fetchPatients(request: PatientsList.Patients.Request) {
        worker = PatientsListWorker()
        guard let response = worker?.fetchPatients() else {
            presenter?.presentError(error: nil)
            return
        }
        
        presenter?.presentPatients(response: response)
    }

    func selectPatient(request: PatientsList.Select.Request) {
        self.patientId = request.patientId
        presenter?.presentPatientDetail(response: PatientsList.Select.Response())
    }
}

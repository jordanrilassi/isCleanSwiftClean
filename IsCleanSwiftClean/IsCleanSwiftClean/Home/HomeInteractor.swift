// Copyright (C) SNAL, Inc - All Rights Reserved
// Unauthorized copying of this file, via any medium is strictly prohibited
// Proprietary and confidential
// Created by Jordan Rilassi on 13/09/2019.

import UIKit

protocol HomeBusinessLogic {
    func fetchPatients(request: Home.Patients.Request)
    func selectPatient(request: Home.Select.Request)
}

protocol HomeDataStore {
    var patientId: String { get set }
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    var presenter: HomePresentationLogic?
    var worker: HomeWorker?

    var patientId: String = ""

    // MARK: Fetch form
    
    func fetchPatients(request: Home.Patients.Request) {
        worker = HomeWorker()
        guard let response = worker?.fetchPatients() else {
            presenter?.presentError(error: nil)
            return
        }
        
        presenter?.presentPatients(response: response)
    }

    func selectPatient(request: Home.Select.Request) {
        self.patientId = request.patientId
        presenter?.presentPatientDetail(response: Home.Select.Response())
    }
}

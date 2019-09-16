// Copyright (C) SNAL, Inc - All Rights Reserved
// Unauthorized copying of this file, via any medium is strictly prohibited
// Proprietary and confidential
// Created by Jordan Rilassi on 13/09/2019.

import UIKit

protocol PatientDetailBusinessLogic {
    func fetchPatientDetail(request: PatientDetail.PatientDetail.Request)
}

protocol PatientDetailDataStore {
    var patientId: String { get set }
}

class PatientDetailInteractor: PatientDetailBusinessLogic, PatientDetailDataStore {
    var presenter: PatientDetailPresentationLogic?
    var worker: PatientDetailWorker?
    var patientId: String = ""

    // MARK: Fetch form
    
    func fetchPatientDetail(request: PatientDetail.PatientDetail.Request) {
        worker = PatientDetailWorker()
        guard let patient = worker?.fetchPatient(with: patientId) else { return }
        
        let response = PatientDetail.PatientDetail.Response(firstName: patient.firstName, lastName: patient.lastName, gender: patient.gender)
        presenter?.presentPatientDetail(response: response)
    }
}

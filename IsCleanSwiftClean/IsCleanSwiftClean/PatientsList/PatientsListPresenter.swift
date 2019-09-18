// Copyright (C) SNAL, Inc - All Rights Reserved
// Unauthorized copying of this file, via any medium is strictly prohibited
// Proprietary and confidential
// Created by Jordan Rilassi on 13/09/2019.

import UIKit

protocol PatientsListPresentationLogic {
    func presentPatients(response: PatientsList.Patients.Response)
    func presentPatientDetail(response: PatientsList.Select.Response)
    func presentError(error: Error?)
}

class PatientsListPresenter: PatientsListPresentationLogic {
    weak var viewController: PatientsListDisplayLogic?

    // MARK: Display form
    
    func presentPatients(response: PatientsList.Patients.Response) {
        let patientModels = response.patients.compactMap { PatientsList.Patients.ViewModel.PatientModel(id: $0.id, fullName: "\($0.firstName) \($0.lastName)") }
        let viewModel = PatientsList.Patients.ViewModel(patientModels: patientModels)
        viewController?.displayPatients(viewModel: viewModel)
    }

    func presentPatientDetail(response: PatientsList.Select.Response) {
        viewController?.displayPatientDetail(viewModel: PatientsList.Select.ViewModel())
    }

    func presentError(error: Error?) {
        viewController?.displayError(error: error)
    }
}

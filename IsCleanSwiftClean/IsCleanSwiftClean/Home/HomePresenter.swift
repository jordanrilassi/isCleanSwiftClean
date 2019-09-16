// Copyright (C) SNAL, Inc - All Rights Reserved
// Unauthorized copying of this file, via any medium is strictly prohibited
// Proprietary and confidential
// Created by Jordan Rilassi on 13/09/2019.

import UIKit

protocol HomePresentationLogic {
    func presentPatients(response: Home.Patients.Response)
    func presentPatientDetail(response: Home.Select.Response)
    func presentError(error: Error?)
}

class HomePresenter: HomePresentationLogic {
    weak var viewController: HomeDisplayLogic?

    // MARK: Display form
    
    func presentPatients(response: Home.Patients.Response) {
        let viewModel = Home.Patients.ViewModel(patients: response.patients)
        viewController?.displayPatients(viewModel: viewModel)
    }

    func presentPatientDetail(response: Home.Select.Response) {
        viewController?.displayPatientDetail(viewModel: Home.Select.ViewModel())
    }

    func presentError(error: Error?) {
        viewController?.displayError(error: error)
    }
}

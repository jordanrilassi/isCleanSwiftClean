// Copyright (C) SNAL, Inc - All Rights Reserved
// Unauthorized copying of this file, via any medium is strictly prohibited
// Proprietary and confidential
// Created by Jordan Rilassi on 13/09/2019.

import UIKit

protocol PatientDetailPresentationLogic {
    func presentPatientDetail(response: PatientDetail.PatientDetail.Response)
}

class PatientDetailPresenter: PatientDetailPresentationLogic {
    weak var viewController: PatientDetailDisplayLogic?
    
    // MARK: Display form
    
    func presentPatientDetail(response: PatientDetail.PatientDetail.Response) {
        let fullName = "\(response.firstName) \(response.lastName)"
        let genderImage = response.gender.image
        let viewModel = PatientDetail.PatientDetail.ViewModel(fullName: fullName, image: genderImage)
        viewController?.displayPatientDetail(viewModel: viewModel)
    }
}

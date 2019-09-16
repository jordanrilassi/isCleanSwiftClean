// Copyright (C) SNAL, Inc - All Rights Reserved
// Unauthorized copying of this file, via any medium is strictly prohibited
// Proprietary and confidential
// Created by Jordan Rilassi on 13/09/2019.

import UIKit

protocol PatientDetailDisplayLogic: class {
    func displayPatientDetail(viewModel: PatientDetail.PatientDetail.ViewModel)
}

class PatientDetailViewController: UIViewController, PatientDetailDisplayLogic {
    var interactor: PatientDetailBusinessLogic?
    var router: (NSObjectProtocol & PatientDetailRoutingLogic & PatientDetailDataPassing)?
    
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = PatientDetailInteractor()
        let presenter = PatientDetailPresenter()
        let router = PatientDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPatientDetail()
    }
    
    // MARK: Views actions
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func fetchPatientDetail() {
        let request = PatientDetail.PatientDetail.Request()
        interactor?.fetchPatientDetail(request: request)
    }
    
    func displayPatientDetail(viewModel: PatientDetail.PatientDetail.ViewModel) {
        fullName.text = viewModel.fullName
        avatarImageView.image = viewModel.image
    }
}

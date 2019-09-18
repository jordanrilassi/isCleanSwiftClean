// Copyright (C) SNAL, Inc - All Rights Reserved
// Unauthorized copying of this file, via any medium is strictly prohibited
// Proprietary and confidential
// Created by Jordan Rilassi on 13/09/2019.

import UIKit

protocol PatientsListDisplayLogic: class {
    func displayPatients(viewModel: PatientsList.Patients.ViewModel)
    func displayPatientDetail(viewModel: PatientsList.Select.ViewModel)
    func displayError(error: Error?)
}

class PatientsListViewController: UIViewController, PatientsListDisplayLogic {
    var interactor: PatientsListBusinessLogic?
    var router: (NSObjectProtocol & PatientsListRoutingLogic & PatientsListDataPassing)?

    @IBOutlet weak var tableView: UITableView!

    var fullNameTextField: UITextField = UITextField()
    var patientModels: [PatientsList.Patients.ViewModel.PatientModel] = []
    
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
        let interactor = PatientsListInteractor()
        let presenter = PatientsListPresenter()
        let router = PatientsListRouter()
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
        tableView.register(PatientCell.self, forCellReuseIdentifier: "PatientCell")
        fetchPatient()
    }
    
    // MARK: Views actions

    func fetchPatient() {
        let request = PatientsList.Patients.Request()
        interactor?.fetchPatients(request: request)
    }
    
    func displayPatients(viewModel: PatientsList.Patients.ViewModel) {
        patientModels = viewModel.patientModels
        tableView.reloadData()
    }

    func displayPatientDetail(viewModel: PatientsList.Select.ViewModel) {
        router?.routeToPatientDetail(segue: nil)
    }

    func displayError(error: Error?) {
        print("Error fetching patient ! - \(error?.localizedDescription ?? "No error description")")
    }
}

extension PatientsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patientModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatientCell", for: indexPath)

        let patientModel = patientModels[indexPath.row]
        cell.textLabel?.text = patientModel.fullName
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let patientModel = patientModels[indexPath.row]
        let request = PatientsList.Select.Request(patientId: patientModel.id)
        interactor?.selectPatient(request: request)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// Copyright (C) SNAL, Inc - All Rights Reserved
// Unauthorized copying of this file, via any medium is strictly prohibited
// Proprietary and confidential
// Created by Jordan Rilassi on 13/09/2019.

import UIKit

protocol HomeDisplayLogic: class {
    func displayPatients(viewModel: Home.Patients.ViewModel)
    func displayPatientDetail(viewModel: Home.Select.ViewModel)
    func displayError(error: Error?)
}

class HomeViewController: UIViewController, HomeDisplayLogic {
    var interactor: HomeBusinessLogic?
    var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?

    @IBOutlet weak var tableView: UITableView!

    var fullNameTextField: UITextField = UITextField()
    var patients: [Patient] = []
    
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
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
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
        let request = Home.Patients.Request()
        interactor?.fetchPatients(request: request)
    }
    
    func displayPatients(viewModel: Home.Patients.ViewModel) {
        patients = viewModel.patients
        tableView.reloadData()
    }

    func displayPatientDetail(viewModel: Home.Select.ViewModel) {
        router?.routeToPatientDetail(segue: nil)
    }

    func displayError(error: Error?) {
        print("Error fetching patient ! - \(error?.localizedDescription ?? "No error description")")
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patients.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatientCell", for: indexPath)

        let patient = patients[indexPath.row]
        cell.textLabel?.text = "\(patient.firstName) \(patient.lastName)"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let patient = patients[indexPath.row]
        let request = Home.Select.Request(patientId: patient.id)
        interactor?.selectPatient(request: request)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

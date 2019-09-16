// Copyright (C) SNAL, Inc - All Rights Reserved
// Unauthorized copying of this file, via any medium is strictly prohibited
// Proprietary and confidential
// Created by Jordan Rilassi on 13/09/2019.

import UIKit

@objc protocol HomeRoutingLogic {
    func routeToPatientDetail(segue: UIStoryboardSegue?)
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
    
    // MARK: Routing
    
    func routeToPatientDetail(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! PatientDetailViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToPatientDetail(source: dataStore!, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "PatientDetailViewController") as! PatientDetailViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToPatientDetail(source: dataStore!, destination: &destinationDS)
            navigateToPatientDetail(source: viewController!, destination: destinationVC)
        }
    }

    // MARK: Navigation
    
    func navigateToPatientDetail(source: HomeViewController, destination: PatientDetailViewController) {
        source.show(destination, sender: nil)
    }

    // MARK: Passing data

    func passDataToPatientDetail(source: HomeDataStore, destination: inout PatientDetailDataStore) {
        destination.patientId = source.patientId
    }
}

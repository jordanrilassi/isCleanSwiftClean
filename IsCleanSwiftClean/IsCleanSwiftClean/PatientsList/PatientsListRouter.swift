// Copyright (C) SNAL, Inc - All Rights Reserved
// Unauthorized copying of this file, via any medium is strictly prohibited
// Proprietary and confidential
// Created by Jordan Rilassi on 13/09/2019.

import UIKit

@objc protocol PatientsListRoutingLogic {
    func routeToPatientDetail(segue: UIStoryboardSegue?)
}

protocol PatientsListDataPassing {
    var dataStore: PatientsListDataStore? { get }
}

class PatientsListRouter: NSObject, PatientsListRoutingLogic, PatientsListDataPassing {
    weak var viewController: PatientsListViewController?
    var dataStore: PatientsListDataStore?
    
    // MARK: Routing
    
    func routeToPatientDetail(segue: UIStoryboardSegue?) {
//        if let segue = segue {
//            let destinationVC = segue.destination as! PatientDetailViewController
//            var destinationDS = destinationVC.router!.dataStore!
//            passDataToPatientDetail(source: dataStore!, destination: &destinationDS)
//        } else {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let destinationVC = storyboard.instantiateViewController(withIdentifier: "PatientDetailViewController") as! PatientDetailViewController
//            var destinationDS = destinationVC.router!.dataStore!
//            passDataToPatientDetail(source: dataStore!, destination: &destinationDS)
//            navigateToPatientDetail(source: viewController!, destination: destinationVC)
//        }
    }

    // MARK: Navigation
    
//    func navigateToPatientDetail(source: PatientsListViewController, destination: PatientDetailViewController) {
//        source.show(destination, sender: nil)
//    }

    // MARK: Passing data

//    func passDataToPatientDetail(source: PatientsListDataStore, destination: inout PatientDetailDataStore) {
//        destination.patientId = source.patientId
//    }
}

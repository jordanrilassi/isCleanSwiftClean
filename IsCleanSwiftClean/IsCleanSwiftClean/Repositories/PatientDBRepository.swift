//
//  PatientInteractor.swift
//  IsCleanSwiftClean
//
//  Created by Jordan Rilassi on 13/09/2019.
//  Copyright © 2019 Jordan. All rights reserved.
//

import Foundation

class PatientDBRepository {
    var mockPatients = [Patient(id: "1", firstName: "John", lastName: "Doe", gender: .male), Patient(id: "2", firstName: "Jeanne", lastName: "Dark", gender: .female), Patient(id: "3", firstName: "Uncle", lastName: "Bob", gender: .male)]

    func fetchPatients() -> [Patient] {
        return mockPatients
    }

    func fetchPatient(with patientId: String) -> Patient? {
        return mockPatients.first(where: { $0.id == patientId })
    }
}

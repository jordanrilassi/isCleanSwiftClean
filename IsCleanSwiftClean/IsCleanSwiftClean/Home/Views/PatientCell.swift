//
//  PatientCell.swift
//  IsCleanSwiftClean
//
//  Created by Jordan Rilassi on 16/09/2019.
//  Copyright © 2019 Jordan. All rights reserved.
//

import UIKit

class PatientCell: UITableViewCell {
    @IBOutlet weak var patientLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

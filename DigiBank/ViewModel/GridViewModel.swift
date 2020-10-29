//
//  GridViewModel.swift
//  DigiBank
//
//  Created by priya.kashid on 29/10/20.
//  Copyright © 2020 priya.kashid. All rights reserved.
//

import Foundation

protocol gridModelViewDelgate {
    func sendValue(gGrid: String?,cGrid: String?, oGrid: String?)
}

class GridViewModel: gridModelViewDelgate {
    
    var delegate: GridViewController?
    func sendValue(gGrid: String?, cGrid: String?, oGrid: String?) {
        
        
        guard cGrid == Constants.FundTransfer.cGridString else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.FundTransfer.cGridValidate, imageName: Constants.alertImages.checkImage)
            return
        }
        
        guard  gGrid == Constants.FundTransfer.gGridString else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.FundTransfer.gGridValidate, imageName: Constants.alertImages.checkImage)
            return
        }
        
        
        
        guard oGrid == Constants.FundTransfer.oGridString  else {
            delegate?.showAlert(title: Constants.alertString.Error, errorMessage: Constants.FundTransfer.oGridValidate, imageName: Constants.alertImages.checkImage)
            return
        }
        
        delegate?.moveToNextScreen()
    }
    
    
}

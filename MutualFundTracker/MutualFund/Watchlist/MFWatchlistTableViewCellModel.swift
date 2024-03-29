//
//  MFWatchlistTableViewCellModel.swift
//  MutualFundTracker
//
//  Created by Rajesh RAMSHETTY SIDDARAJU on 16/03/21.
//

import Foundation
import UIKit

class MFWatchlistTableViewCellModel {
    var name: String?
    var code: String?
    var value: Double
    var nav: String?
    var cagr: String?
    var date: String?
    var change: String?
    var details: String?
    var cagrColor: UIColor = .red
    var changeColor: UIColor = .red
    
    init(mfScheme: MFScheme) {
        name = mfScheme.name
        code = mfScheme.code
        details = mfScheme.code
        value = 0.0
        cagr = "0.00%"
        change = "-0.00%"
        if let mfNavs = mfScheme.performance?.array as? [SchemeNav] {
            if let mfNav = mfNavs.first {
                value = mfNav.nav
                if mfNavs.count > 1, mfNavs[1].nav > 0 {
                    let changeVal = ((value - mfNavs[1].nav)/mfNavs[1].nav) * 100
                    change = String(format: "%.2f %%", changeVal)
                    changeColor = changeVal > 0 ? .greenLight : .red
                }
            }
        }
        nav = String(describing: value)
    }
    
}

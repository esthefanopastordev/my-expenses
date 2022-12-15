//
//  DetalleTransaccionBuilder.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 15/12/22.
//

import Foundation
import UIKit

class DetalleTransaccionBuilder {
    static func build(_ detalle: TransaccionResponse) -> UIViewController {
        let storybard = UIStoryboard(name: "Main", bundle: nil)
        let view = storybard.instantiateViewController(withIdentifier: "DetalleTransaccionViewController") as! DetalleTransaccionViewController
        view.transaction = detalle
        return view
    }
}

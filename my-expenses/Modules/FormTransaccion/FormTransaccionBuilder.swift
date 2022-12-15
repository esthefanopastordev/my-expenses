//
//  FormTransaccionBuilder.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 15/12/22.
//

import Foundation
import UIKit

class FormTransaccionBuilder {
    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "FormTransaccionViewController") as! FormTransaccionViewController
        
        return view
    }
}

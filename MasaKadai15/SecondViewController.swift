//
//  SecondViewController.swift
//  MasaKadai15
//
//  Created by Mina on 2023/06/03.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet private weak var inputTextField: UITextField!

    func getInputText() -> String {
        inputTextField.text ?? ""
    }
}

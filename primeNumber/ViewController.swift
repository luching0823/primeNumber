//
//  ViewController.swift
//  primeNumber
//
//  Created by 廖昱晴 on 2021/2/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    var inputNumber = 15
    var isPrime: Bool? = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.becomeFirstResponder()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func doThePrimeTest(_ sender: UIButton) {
        if let inputText = inputTextField.text, let inputNumber = Int(inputText) {
            checkPrime(number: inputNumber) { (result) in
                self.resultLabel.text = result
                self.resultLabel.isHidden = false
            }
            resultLabel.isHidden = false
        }
        inputTextField.text = ""
    }
    
    func checkPrime(testNumber: Int) -> String {
        if testNumber <= 0 {
            isPrime = nil
        } else if testNumber == 1 {
            isPrime = false
        } else {
            for i in 2..<testNumber {
                if testNumber % i == 0 {
                    isPrime = false
                    break
                }
            }
        }
        switch isPrime {
        case true:
            return "\(testNumber) is prime"
        case false:
            return "\(testNumber) is not prime"
        default:
            return "Please enter a number greater than 0"
        }
    }

    func checkPrime(number: Int, handler:(String) -> ()) {
        handler(checkPrime(testNumber: number))
    }
}


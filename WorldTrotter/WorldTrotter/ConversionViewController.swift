//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by yukun on 2017/10/15.
//  Copyright © 2017年 SouthWest University-yukun. All rights reserved.
//

import UIKit

class ConversionViewController:UIViewController,UITextFieldDelegate{
    
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    var fahrenHeitValues:Double?{
        didSet{
            updateCelsiusLabel()
        }
    }
    let numberFormatter:NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    @IBAction func fahrenHeitFieldEditingChanged(_ sender: UITextField) {
        if let text = sender.text,let value = Double(text){
            fahrenHeitValues = value
        }else{
            fahrenHeitValues = nil
        }
    }
    @IBAction func dismissKeyboard(_ sender: Any) {
        textField.resignFirstResponder()
    }
    
    var celsiusValue:Double?{
        if let value = fahrenHeitValues{
            return (value - 32) * 5/9
        }else{
            return nil
        }
    }
    
    func updateCelsiusLabel(){
        if let value = celsiusValue{
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value:value))
        }else{
            celsiusLabel.text = "???"
        }
    }
    //不准输入两个小数点儿
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        //防止输入太多变形
        if let text = textField.text,!string.isEmpty{
            if text.count > 4{
                return false
            }
        }
        //不可以输入字母
        for char in string.unicodeScalars{
            if NSCharacterSet.decimalDigits.contains(char) == false,char != "."{
                return false
            }
        }
        //不可以输入两个.
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil{
            return false
        }else{
            return true
        }
    }
    override func viewDidLoad() {
        print("ConversionViewController loaded its view.")
    }
    override func viewWillAppear(_ animated: Bool) {
        let currentdate = Date()
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year,.month, .day, .hour,.minute,.second], from: currentdate )
        if let clock = dateComponents.hour{
            if clock > 19,clock < 6{
                view.backgroundColor = UIColor.black
            }else{
//                view.backgroundColor = UIColor(displayP3Red: 245, green: 244, blue: 241, alpha: 255)和storyboard有差别
            }
        }
    }
}


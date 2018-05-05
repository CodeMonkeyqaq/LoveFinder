//
//  ViewController.swift
//  LoveFinder
//
//  Created by 王星洲 on 2018/4/30.
//  Copyright © 2018年 cn.edu.tongji.1652977. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        name.resignFirstResponder()
        return true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        name.resignFirstResponder()
    }
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var gender: UISegmentedControl!
    
    @IBOutlet weak var birthday: UIDatePicker!
    
    @IBOutlet weak var height: UISlider!
    
    @IBOutlet weak var heightLayOut: UILabel!
    
    @IBOutlet weak var hasProperty: UISwitch!
    
    @IBOutlet weak var result: UITextView!
    

    @IBAction func heightChanged(_ sender: Any) {
        let slider = sender as! UISlider
        heightLayOut.text = "\(Int(slider.value))cm"
    }
    
    @IBAction func okTapped(_ sender: Any) {
        let genderText = (gender.selectedSegmentIndex == 0) ? "高富帅" : "白富美"
        let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        let now = NSDate()
        let components = gregorian?.components(NSCalendar.Unit.year, from: birthday.date, to: now as Date, options: NSCalendar.Options(rawValue: 0))
        let age = components?.year
        let hasPropertyText = hasProperty.isOn ? "有房" : "没房"
        result.text = "\(name.text!), \(age!)岁, \(genderText), \(heightLayOut.text!), \(hasPropertyText), 求交往!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        name.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


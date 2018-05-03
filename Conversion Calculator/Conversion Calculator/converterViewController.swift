//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by t s on 5/2/18.
//  Copyright © 2018 Shuper. All rights reserved.
//

import UIKit

class converterViewController: UIViewController {
    
    var Converter: [converter] = [converter]()
    
    var inputNum = ""
    var outputNum = ""
    var stringNum: String = ""
    var negativeNum = true
    
   
    
    var newConverter = converter(label: "fahrenheit to celcius", inputType: "°F", outputType: "°C")
    
    //top box
    @IBOutlet weak var outputDisplay: UITextField!
    //bottom box
    @IBOutlet weak var inputDisplay: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Converter = [
            converter(label: "fahrenheit to celcius", inputType: "°F", outputType: "°C"),
            converter(label: "celcius to fahrenheit", inputType: "°C", outputType: "°F"),
            converter(label: "miles to kilometer", inputType: "mi", outputType: "km"),
            converter(label: "kilometers to miles", inputType: "km", outputType: "mi")]
        
        let readyConverter = Converter[0]
        
        outputDisplay.text = readyConverter.outputType
        inputDisplay.text = readyConverter.inputType
        
        // Do any additional setup after loading the view.
    }
    
    
    //Button Handling
    
    @IBAction func converterButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title:"Choose Converter", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        for converters in Converter {
            alert.addAction(UIAlertAction(title: converters.label, style: UIAlertActionStyle.default, handler: {
                (alertAction) -> Void in
                    self.inputDisplay.text = self.inputNum + " " + converters.inputType
                    self.outputDisplay.text = converters.outputType
                    self.newConverter.label = converters.label
                    self.newConverter.outputType = converters.outputType
                    self.newConverter.inputType = converters.inputType
                if let input = Double(self.inputNum){
                    self.outputDisplay.text = self.calculations(input: input, currentConverter: self.newConverter)
                }
            }))
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    //linking the numbered buttons
    @IBAction func numbers(_ sender: UIButton) {
        inputNum.append(sender.currentTitle!)
        inputDisplay.text = inputNum + " " + newConverter.inputType
        if let input = Double(inputNum){
            self.outputDisplay.text = calculations(input: input, currentConverter: newConverter)
        }
    }
    
    //linking the Clear button
    @IBAction func clear(_ sender: UIButton) {
        stringNum = ""
        inputDisplay.text = "" + self.newConverter.inputType
        outputDisplay.text = "" + self.newConverter.outputType
        inputNum = ""
    }
    //linking +/- button
    @IBAction func plusMinus(_ sender: UIButton) {
        if negativeNum {
            inputNum = "-" + inputNum
            negativeNum = false
        } else {
            inputNum.removeFirst()
            negativeNum = true
        }
        if let input = Double(inputNum){
            self.inputDisplay.text = inputNum + " " + newConverter.inputType
            self.outputDisplay.text = calculations(input: input, currentConverter: newConverter)
        }
    }
    
    //handles the arithmetic for each conversion
    func calculations(input: Double, currentConverter: converter) -> String {
        
        var output = 0.0
        
        switch (currentConverter.label) {
        case "FtoC":
            output = ((input - 32) * (5/9))
        
        case "CtoF":
            output = (input * (9/5)) + 32
            
        case "MItoKI":
            output = input * 1.609344
            
        case "KItoMI":
            output = input * 0.6214
            
        default:
            break
        }
        outputNum = String.localizedStringWithFormat("%.2f", output) + " " + currentConverter.outputType
        return outputNum
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

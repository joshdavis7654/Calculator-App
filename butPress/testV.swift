//
//  testV.swift
//  butPress
//
//  Created by Josh on 2018-07-16.
//  Copyright © 2018 Josh. All rights reserved.
//

import UIKit

class testV: UIViewController {
    var stor:[Double] = []             //variable to store Doubles for math
    var m = ""//variable to hold current math symbol
    var m2 = ""
    var place = ""                      //place holder for text to convert to number
    var place2 = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //function to handle number presses
    @IBAction func numButton(_ sender: UIButton) {
        if(m2 == "="){
            calcText.text = ""
            place = ""
            if(stor.count > 0){
                stor.remove(at: 0)      //clear storage array
            }
            m = ""
            m2 = ""
            place2 = ""
            
        }
        m2 = ""
        if(place == "" && sender.currentTitle! == "0"){
           place = "0."
           calcText.text = calcText.text! + place
        }
        
        else{
            calcText.text = calcText.text! + sender.currentTitle!  //adds the number to the text screen
            place = place + sender.currentTitle!        //adds string num to place for later conversion
        
            if(m == ""){
            
                if(stor.count == 0){
                    let y = Double(place)
                    stor.append(y!)
                }
            
                else{
                    let y = Double(place)
                    stor[stor.count - 1] = y!
                }
                
            }
        
    
    
            else{
                if(m == "+"){
                    let y = Double(place)
                    let x = stor[0] + y!
                    equalLabel.text = String(x) //shows what the result is in the equal text
                }
            
                if(m == "-"){
                    let y = Double(place)
                    let x = stor[0] - y!
                    equalLabel.text = String(x) //shows what the result is in the equal text
                }
            
                if(m == "*"){
                    let y = Double(place)
                    let x = stor[0] * y!
                    equalLabel.text = String(x) //shows what the result is in the equal text
                }
            
                if(m == "/"){
                    let y = Double(place)
                    let x = stor[0] / y!
                    equalLabel.text = String(x) //shows what the result is in the equal text
                }
            }
        }
        
        
    }
    
    @IBOutlet weak var calcText: UILabel!
    
    @IBAction func clearButton(_ sender: UIButton) {
        calcText.text = ""      //sets text to clear
        place = ""              //sets place conversion to blank
        equalLabel.text = ""    //sets equal text to blank
        if(stor.count > 0){
            stor.remove(at: 0)      //clear storage array
        }
        m = ""
        m2 = ""
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        
        if(stor.count != 0 && m2 != "+"){
            m = "+"
            m2 = "+"
            calcText.text = calcText.text! + " + "
            if(place.last == "."){
                
                place = place + "0"
            }
            if(equalLabel.text != ""){
                
                let y = Double(equalLabel.text!)
                stor[0] = y!
                equalLabel.text = ""
                place = ""
                
            }
            
            else{
                place = ""
            }
        }
        
    }
    
    @IBAction func subButton(_ sender: UIButton) {
        
        if(stor.count != 0 && m2 != "-"){
            m = "-"
            m2 = "-"
            calcText.text = calcText.text! + " - "
            if(place.last == "."){
                
                place = place + "0"
            }
            
            if(equalLabel.text != ""){
                
                let y = Double(equalLabel.text!)
                stor[0] = y!
                equalLabel.text = ""
                place = ""
                
            }
                
            else{
                place = ""
            }
        }
        
    }
 
    @IBAction func multButton(_ sender: UIButton) {
        
        if(stor.count != 0 && m2 != "*"){
            m = "*"
            m2 = "*"
            calcText.text = calcText.text! + " * "
            if(place.last == "."){
                
                place = place + "0"
            }
            
            if(equalLabel.text != ""){
                
                let y = Double(equalLabel.text!)
                stor[0] = y!
                equalLabel.text = ""
                place = ""
                
            }
                
            else{
                place = ""
            }
        }
    }
    
    @IBAction func divButton(_ sender: UIButton) {
        if(stor.count != 0 && m2 != "/"){
            m = "/"
            m2 = "/"
            calcText.text = calcText.text! + " / "
            if(place.last == "."){
                
                place = place + "0"
            }
            
            if(equalLabel.text != ""){
                
                let y = Double(equalLabel.text!)
                stor[0] = y!
                equalLabel.text = ""
                place = ""
                
            }
                
            else{
                place = ""
            }
        }
    }
    
    
    //funcation to control the equal button
    @IBAction func equalButton(_ sender: UIButton) {
        if(m2 == "="){
            if(m == "+"){
                let y = Double(place2)
                let x = stor[0] + y!
                stor[0] = x
                calcText.text = String(x)
            }
            if(m == "-"){
                let y = Double(place2)
                let x = stor[0] - y!
                stor[0] = x
                calcText.text = String(x)
            }
            if(m == "/"){
                let y = Double(place2)
                let x = stor[0] / y!
                stor[0] = x
                calcText.text = String(x)
            }
            if(m == "*"){
                let y = Double(place2)
                let x = stor[0] * y!
                stor[0] = x
                calcText.text = String(x)
            }
            
        }
        else{
            if(equalLabel.text != ""){
                calcText.text = equalLabel.text
                let y = Double(equalLabel.text!)
                stor[0] = y!
                equalLabel.text = ""
                m2 = "="
                place2 = place
                place = ""
            }
        }
    }
    
    @IBAction func decButton(_ sender: UIButton) {
        if(place == ""){
            place = "0."
            calcText.text = calcText.text! + place
        }
        else{
            calcText.text = calcText.text! + "."
            place = place + "."
        }
    }
    
    @IBAction func percent(_ sender: UIButton) {
        if(place != ""){
            if(stor.count != 0){
            
                if(place.last == "."){
                
                    place = place + "0"
                }
                
                let temp = place
            
                if(equalLabel.text != ""){
                    let y = Double(place)
                    
                    if(y != stor[0]){
                        let x = y! * 0.01
                        place = String(x)
                        calcText.text = calcText.text?.replacingOccurrences(of: temp, with: place)
                    
                        if(m=="+"){
                            let t1 = stor[0] + x
                            equalLabel.text = String(t1)
                        }
                    
                        if(m=="-"){
                            let t1 = stor[0] - x
                            equalLabel.text = String(t1)
                        }
                    
                        if(m=="*"){
                            let t1 = stor[0] * x
                            equalLabel.text = String(t1)
                        }
                    
                        if(m=="/"){
                            let t1 = stor[0] / x
                            equalLabel.text = String(t1)
                        }
                    }
                
                }
                
                else{
                    let y = Double(place)
                    let x = y! * 0.01
                    stor[0] = x
                    place = String(x)
                    calcText.text = place
                }
            }
        }
        
        else{
            if(m2 == "="){
                let y = calcText.text!
                let x = Double(y)
                let z = x! * 0.01
                stor[0] = z
                calcText.text = String(z)
                place = String(z)
                
                
                
            }
        }
        
        
    }
    
    @IBOutlet weak var equalLabel: UILabel!
    
    
    
}

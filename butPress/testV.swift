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
    var bracStor:[Double] = []             //variable to store Doubles for math
    var m = ""                          //variable to hold current math symbol
    var m2 = ""
    var m3 = ""                         //variable to hold bracket symbol
    var m4 = ""
    var place = ""                      //place holder for text to convert to number
    var place2 = ""                     //place holder for second number
    var isBrac = false
    var bracPlace1 = ""                     //place holder for use of brackets
    var bracPlace2 = ""                     //place holder for use of brackets
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //function to handle number presses
    @IBAction func numButton(_ sender: UIButton) {
        
        if(m2 == "="){      //if equal was the last button pressed, clear the calc text
            calcText.text = ""
            place = ""
            
            if(stor.count > 0){
                stor.remove(at: 0)      //clear storage array
            }
            if(bracStor.count > 0){
               bracStor.remove(at: 0)
            }
            m = ""
            m2 = ""
            place2 = ""
            bracPlace1 = ""
            m3=""
            m4=""
            
        }
        
        m2 = ""
        m4 = ""
        
        if(isBrac){
            if(bracPlace1 == "" && sender.currentTitle! == "0"){
                bracPlace1 = "0."
                calcText.text = calcText.text! + bracPlace1
            }
            
            else{
                calcText.text = calcText.text! + sender.currentTitle!  //adds the number to the text screen
                bracPlace1 = bracPlace1 + sender.currentTitle!        //adds string num to place for later conversion
                
                /*If the user hasn't pressed +,- etc...*/
                if(m3 == ""){
                    if(bracStor.count == 0){
                        let y = Double(bracPlace1)
                        bracStor.append(y!)
                    }
                        
                    else{
                        let y = Double(bracPlace1)
                        bracStor[bracStor.count - 1] = y!
                    }
                    result(bracSum: bracStor[0])
                }
                    
                    /*If the user has pressed +,-, etc.. */
                else{
                    
                    if(m3 == "+"){       //if the add sign is pressed
                        let y = Double(bracPlace1)
                        let x = bracStor[0] + y!
                        result(bracSum: x) //shows what the result is in the equal text
                    }
                    
                    if(m3 == "-"){       //if the subtract sign is pressed
                        let y = Double(bracPlace1)
                        let x = bracStor[0] - y!
                        result(bracSum: x) //shows what the result is in the equal text
                    }
                    
                    if(m3 == "*"){       //if the multiplication button is pressed
                        let y = Double(bracPlace1)
                        let x = bracStor[0] * y!
                        result(bracSum: x) //shows what the result is in the equal text
                    }
                    
                    if(m3 == "/"){       //if the division button is pressed
                        let y = Double(bracPlace1)
                        let x = bracStor[0] / y!
                        result(bracSum: x) //shows what the result is in the equal text
                    }
                }
            }
            print("bracStor Value: " , bracStor[0], "bracPlace:",bracPlace1,"stor[0]:",stor[0])
            
        }
            
        else{
            /*If the user presses 0 as the first number, automatically add a decimal*/
            if(place == "" && sender.currentTitle! == "0"){
                place = "0."
                calcText.text = calcText.text! + place
            }
        
            else{
                calcText.text = calcText.text! + sender.currentTitle!  //adds the number to the text screen
                place = place + sender.currentTitle!        //adds string num to place for later conversion
            
                /*If the user hasn't pressed +,- etc...*/
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
        
                    /*If the user has pressed +,-, etc.. */
                else{
                
                    if(m == "+"){       //if the add sign is pressed
                        let y = Double(place)
                        let x = stor[0] + y!
                        equalLabel.text = String(x) //shows what the result is in the equal text
                    }
            
                    if(m == "-"){       //if the subtract sign is pressed
                        let y = Double(place)
                        let x = stor[0] - y!
                        equalLabel.text = String(x) //shows what the result is in the equal text
                    }
            
                    if(m == "*"){       //if the multiplication button is pressed
                        let y = Double(place)
                        let x = stor[0] * y!
                        equalLabel.text = String(x) //shows what the result is in the equal text
                    }
            
                    if(m == "/"){       //if the division button is pressed
                        let y = Double(place)
                        let x = stor[0] / y!
                        equalLabel.text = String(x) //shows what the result is in the equal text
                    }
                }
            }
        }
    }
    
    func result(bracSum:Double){
        if(stor.count>0){
            if(m=="+"){
                let x = bracSum + stor[0]
                equalLabel.text = String(x)
            }
            
            else if(m=="-"){
                let x = bracSum - stor[0]
                equalLabel.text = String(x)
            }
            
            else if(m=="/"){
                let x = bracSum / stor[0]
                equalLabel.text = String(x)
            }
            
            else if(m=="*"){
                let x = bracSum * stor[0]
                equalLabel.text = String(x)
            }
            
            else{
                equalLabel.text = String(bracSum)
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
        if(bracStor.count>0){
            bracStor.remove(at: 0)
        }
        m = ""
        m2 = ""
        m3 = ""
        m4 = ""
        bracPlace1 = ""
        isBrac = false
    }
    //function for add button
    @IBAction func addButton(_ sender: UIButton) {
        butControl(symbol: "+")
    }
    //function fot subtract button
    @IBAction func subButton(_ sender: UIButton) {
        butControl(symbol: "-")
    }
    //function for multiply button
    @IBAction func multButton(_ sender: UIButton) {
        butControl(symbol: "*")
    }
    //function for division button
    @IBAction func divButton(_ sender: UIButton) {
       butControl(symbol: "/")
    }
    
    /*Function that handles what to do when +,-,/,* is pressed*/
    func butControl(symbol:String){
        
        let temp = symbol
        //if equation is happening inside brackets
        if(isBrac){
            //if a number has been pressed and if the same symbol hasnt been pressed already
            if(bracStor.count != 0 && m4 != temp){
                m3 = temp
                m4 = temp
                calcText.text = calcText.text! + " " + temp + " "
                //if the user presses the decimal without the 0 first it will add a 0
                if(bracPlace1.last == "."){
                    bracPlace1 = bracPlace1 + "0"
                }
                //if there is a number in the equal label
                if(equalLabel.text != ""){
                    let y = Double(equalLabel.text!)
                    if(m=="+"){
                        bracStor[0] = y! - stor[0]
                    }
                    else if(m=="-"){
                        bracStor[0] = y! + stor[0]
                    }
                    else if(m=="*"){
                        bracStor[0] = y! / stor[0]
                    }
                    else if(m=="/"){
                        bracStor[0] = y! * stor[0]
                    }
                    else{
                        bracStor[0] = y!
                    }
                    
                    equalLabel.text = ""
                    bracPlace1 = ""
                }
                    
                else{
                    bracPlace1 = ""
                }
            }
        }
        
        else{
        //if a number has been pressed and if the same symbol hasnt been pressed already
            if(stor.count != 0 && m2 != temp){
                m = temp
                m2 = temp
                calcText.text = calcText.text! + " " + temp + " "
                //if the user presses the decimal without the 0 first it will add a 0
                if(place.last == "."){
                    place = place + "0"
                }
                //if there is a number in the equal label clear it
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
    }
    
    //function to control the equal button
    @IBAction func equalButton(_ sender: UIButton) {
        if(isBrac){
            isBrac = false
            bracStor.remove(at: 0)
            m3=""
            m4=""
            bracPlace1=""
        }
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
    //Function to handle decimal button press
    @IBAction func decButton(_ sender: UIButton) {
        if(isBrac){
            if(bracPlace1 == ""){
                bracPlace1 = "0."
                calcText.text = calcText.text! + bracPlace1
            }
            else{
                calcText.text = calcText.text! + "."
                bracPlace1 = bracPlace1 + "."
            }
        }
        
        else{
            if(place == ""){
                place = "0."
                calcText.text = calcText.text! + place
            }
            else{
                calcText.text = calcText.text! + "."
                place = place + "."
            }
        }
    }
    //function to handle bracket button press
    @IBAction func bracButton(_ sender: UIButton){
        if(isBrac){
            isBrac = false
            calcText.text = calcText.text! + ")"
            if(m=="+"){
                stor[0]=stor[0]+bracStor[0]
            }
            
            if(m=="-"){
                stor[0]=stor[0]-bracStor[0]
            }
            
            if(m=="/"){
                stor[0]=stor[0]/bracStor[0]
            }
            
            if(m=="*"){
                stor[0]=stor[0]*bracStor[0]
            }
            bracStor.remove(at: 0)
            m3=""
            m4=""
            bracPlace1=""
        }
        else{
            isBrac = true
            calcText.text = calcText.text! + "("
        }
    }
    //function that handles the percent button
    @IBAction func percent(_ sender: UIButton) {
        if(isBrac){
            if(bracPlace1 != ""){
                if(bracStor.count != 0){
                    
                    if(bracPlace1.last == "."){
                        bracPlace1 = bracPlace1 + "0"
                    }
                    
                    let temp = bracPlace1
                    
                    if(equalLabel.text != ""){
                        let y = Double(bracPlace1)
                        
                        if(y != bracStor[0]){
                            let x = y! * 0.01
                            bracPlace1 = String(x)
                            calcText.text = calcText.text?.replacingOccurrences(of: temp, with: bracPlace1)
                            
                            if(m3=="+"){
                                let t1 = bracStor[0] + x
                                equalLabel.text = String(t1)
                            }
                            
                            if(m=="-"){
                                let t1 = bracStor[0] - x
                                equalLabel.text = String(t1)
                            }
                            
                            if(m=="*"){
                                let t1 = bracStor[0] * x
                                equalLabel.text = String(t1)
                            }
                            
                            if(m=="/"){
                                let t1 = bracStor[0] / x
                                equalLabel.text = String(t1)
                            }
                        }
                        
                    }
                        
                    else{
                        let y = Double(bracPlace1)
                        let x = y! * 0.01
                        bracStor[0] = x
                        bracPlace1 = String(x)
                        calcText.text = bracPlace1
                    }
                }
            }
                
            else{
                if(m2 == "="){
                    let y = calcText.text!
                    let x = Double(y)
                    let z = x! * 0.01
                    bracStor[0] = z
                    calcText.text = String(z)
                    bracPlace1 = String(z)
                }
            }
        }
        
        else{
        
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
    }
    
    @IBOutlet weak var equalLabel: UILabel!
    
    
    
}

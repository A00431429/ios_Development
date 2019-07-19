//
//  Page2Controller.swift
//  Assignment 1
//
//  Created by cda on 2019-07-19.
//  Copyright © 2019 cda. All rights reserved.
//

import UIKit

class Page2Controller: UIViewController {

    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var labelfield: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    
//    @IBAction func sliderfunc(_ sender: Any) {
//        if(numberslider.value  > 1905)
//        {     let alert = UIAlertController(title: "Club is a legend. Move to earloier glory days. !!", message:"Procede.", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler:nil))
//            present(alert, animated: true, completion: nil)
//        
//        }
//        if(numberslider.value  < 1905)
//        {     let alert = UIAlertController(title: "Club is a legend. But the legend is yet to born !!", message:"Procede.", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler:nil))
//            present(alert, animated: true, completion: nil)
//            
//        }
//        if(numberslider.value  == 1905){
//          navigateToNextScreen()
//        }
//
//    }
    

//    @IBAction func alert(_ sender: Any) {
//        if(labelfield.text != "1905")
//        {showAlert2()
//        }
//        else
//        {
//           showAlert1()
//            navigateToNextScreen2()
//        }
//        
//    }
    
    @IBAction func sliderFunc(_ sender: Any) {
        labelfield.text = "\(Int(slider.value))"
   print (type(of: labelfield.text))
    
    }
    func showAlert1() {
        let alert = UIAlertController(title: "Correct Answer blu bro. !!", message:"Procede.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler:nil))
        present(alert, animated: true, completion: nil)
    }
    func showAlert2() {
        let alert = UIAlertController(title: "Incorrect Answer. !!", message:"Please Try Again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler:nil))
        present(alert, animated: true, completion: nil)
    }
    func navigateToNextScreen2()
    {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "Page3Controller")
        present(viewController, animated: true, completion: nil)
    }
    
    
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */






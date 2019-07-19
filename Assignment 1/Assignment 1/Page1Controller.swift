//
//  Page1Controller.swift
//  Assignment 1
//
//  Created by cda on 2019-07-19.
//  Copyright © 2019 cda. All rights reserved.
//

import UIKit

class Page1Controller: UIViewController {

    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func Page1Answer(_ sender: UIButton) {
    
    
        switch sender.tag {
        case 1:
            showAlert2()
        case 2:
            showAlert2()
        case 3:
            //showAlert1()
            //navigateToNextScreen()
            print ("at 3")
        case 4:
            showAlert2()
            
        default:
            print("Defualt Called")
        }
    
    }
    
    
    
    @IBAction func but2ans(_ sender: Any) {
        showAlert2()
    }
    
    
    
    @IBAction func but3ans(_ sender: Any) {
        //showAlert1()
        //navigateToNextScreen()
         print ("at 3")
    }
    
    
    @IBAction func but4ans(_ sender: Any) {
        showAlert2()
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
    func navigateToNextScreen()
    {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "Page2Controller")
        present(viewController, animated: true, completion: nil)
    }
    
    
    
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

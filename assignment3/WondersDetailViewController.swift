//
//  WondersDetailViewController.swift
//  assignment2
//
//  Created by cda on 2019-07-27.
//  Copyright © 2019 cda. All rights reserved.
//

import UIKit
import CoreLocation

class WondersDetailViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var label: UILabel!
    
    var wonders: Wonders?
    
    var detail = ""
    var imageURL = ""
    var heading = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = heading
        desc.text =  detail
        let url = URL(string: imageURL)!
        downloaded(from: url)
        
        let tapImage = UITapGestureRecognizer(target: self, action: #selector(WondersDetailViewController.imageTapped))
        image.addGestureRecognizer(tapImage)
        image.isUserInteractionEnabled = true
    }
    
    @objc func imageTapped()
    {
        showAlert()
    }
    
    func showAlert() {
        
        let alertController = UIAlertController(title: "Alert", message: "Copy this Image URL?", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Copy", style: .default) { (action:UIAlertAction!) in
                UIPasteboard.general.string = self.imageURL
            })
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        
        present(alertController, animated: true, completion:nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "map_segue"{
            let mapViewController = segue.destination as? MapViewController
            
            let latitude = wonders?.coordinates[1]
            let longitude = wonders?.coordinates[0]
            
            mapViewController?.wonderLocation = CLLocation(latitude:latitude!, longitude:longitude!)
            mapViewController?.wonderLocationNew = CLLocation(latitude:latitude! - 0.005, longitude:longitude! - 0.005)
            mapViewController?.wonderName = heading
            
        }
    }
    
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        //contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image.image = image
                
            }
            }.resume()
        
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

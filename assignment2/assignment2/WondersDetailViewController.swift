//
//  WondersDetailViewController.swift
//  assignment2
//
//  Created by cda on 2019-07-27.
//  Copyright © 2019 cda. All rights reserved.
//

import UIKit

class WondersDetailViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var label: UILabel!
    
    var detail = ""
    var imageURL = ""
    var heading = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = heading
        desc.text =  detail
        let url = URL(string: imageURL)!
        downloaded(from: url)
        // Do any additional setup after loading the view.
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

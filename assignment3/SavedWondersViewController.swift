//
//  SavedWondersViewController.swift
//  assignment2
//
//  Created by name on 2019-08-09.
//  Copyright © 2019 cda. All rights reserved.
//

import UIKit

class SavedWondersViewController: UIViewController {

    
    @IBOutlet weak var PageController: UIPageControl!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var savedWonders : [Wonders] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        print (savedWonders)
    
        let Slide = createSlides()
        scrollView.delegate = self
        PageController.numberOfPages = Slide.count // ````````` EDIT HERE
        PageController.currentPage = 0
        setupScrollView(slides: Slide)
        
        // Do any additional setup after loading the view.
    }
    


    func createSlides() -> [Slide] {
        
        let slide1: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.slideLabel.text = savedWonders[0].name
        let slide2: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.slideLabel.text = savedWonders[1].name
        let slide3: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.slideLabel.text = savedWonders[2].name
        let slide4: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide4.slideLabel.text = savedWonders[3].name
        let slide5: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide5.slideLabel.text = savedWonders[4].name
        let slide6: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide6.slideLabel.text = savedWonders[5].name
        let slide7: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide7.slideLabel.text = savedWonders[6].name
        return [slide1, slide2, slide3, slide4, slide5, slide6, slide7]
    }

    
    func setupScrollView(slides: [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        
        for index in 0..<slides.count {
            slides[index].frame = CGRect(x: view.frame.width * CGFloat(index), y: 0, width: view.frame.width, height: view.frame.height)
            PageController.addSubview(slides[index])
        }
    }

}
extension SavedWondersViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 || scrollView.contentOffset.y < 0 {
            scrollView.contentOffset.y = 0
        }
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        PageController.currentPage = Int (pageIndex)
    
 }
}

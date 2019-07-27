//
//  NewTableViewController.swift
//  assignment2
//
//  Created by cda on 2019-07-27.
//  Copyright © 2019 cda. All rights reserved.
//

import UIKit

class NewTableViewController: UIViewController {
    var wonders:  [Wonders] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJsonFile()
        // Do any additional setup after loading the view.
    }
    
    func loadJsonFile(){
        guard let jsonFile = Bundle.main.path(forResource: "wonders", ofType: "json") else { return }
        let optionalData = try? Data(contentsOf: URL(fileURLWithPath: jsonFile))
        guard
            let data = optionalData,
            let json = try? JSONSerialization.jsonObject(with: data),
            let dictionary = json as? [String: Any],
            let wondersDictionary = dictionary["features"] as? [[String: Any ]]
            else { return }
        let validWonders = wondersDictionary.compactMap { Wonders(wonder: $0) }
        wonders.append(contentsOf: validWonders)
    }

}

extension NewTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wonders.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CellTableViewCell.self), for: indexPath)
            as? CellTableViewCell else { return UITableViewCell() }
        
        cell.wonderLabelView.text = wonders[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("wonders  \(wonders[indexPath.row].name) item clicked")
        guard let detailvc = storyboard?.instantiateViewController(withIdentifier: "WondersDetailViewController") as? WondersDetailViewController else {print("didn't work"); return }
       
        detailvc.heading = wonders[indexPath.row].name
        print(detailvc)
        detailvc.detail = wonders[indexPath.row].description ?? "Nothing Present"
        detailvc.imageURL = wonders[indexPath.row].imageURL
        
        self.navigationController?.pushViewController(detailvc, animated:true)
    }
}

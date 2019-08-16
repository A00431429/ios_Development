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
    var dataToSave = Data()
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("Wonders")

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
//        if wonders.count > 1
//        {
//            saveToLocalStorage()
//        }
    }

    
//    override func prepare(for segue : UIStoryboardSegue, sender : Any?)
//    {
//        if(segue.identifier == "SaveWonderSegue"){
//        let savedWondersViewController  =  segue.destination as? SavedWondersViewController
//        savedWondersViewController?.savedWonders = loadSavedData()
//        }
//    }
    
    
    
//    func saveToLocalStorage()
//    {
//        do {
//            dataToSave = try NSKeyedArchiver.archivedData(withRootObject: wonders, requiringSecureCoding: false)
//            try dataToSave.write(to: NewTableViewController.ArchiveURL)
//        }catch {
//            print ("Could not Write")
//        }
//    }
//
//
//    func loadSavedData() -> [Wonders]{
//        var saveWonders: [Wonders] = []
//        do {
//            if let loadedStrings = try
//                NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dataToSave) as? [Wonders] {
//                saveWonders = loadedStrings
//            }
//        } catch{
//            print("Could not read")
//        }
//        return saveWonders
//    }
    
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
        
        detailvc.detail = wonders[indexPath.row].wonderDescription ?? "No Description"
        detailvc.imageURL = wonders[indexPath.row].imageURL
        detailvc.wonders = wonders[indexPath.row]
        
        print(detailvc.wonders)
        
        self.navigationController?.pushViewController(detailvc, animated:true)

    }
}



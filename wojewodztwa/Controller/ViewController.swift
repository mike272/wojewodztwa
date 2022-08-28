//
//  ViewController.swift
//  wojewodztwa
//
//  Created by Wojciech Babinski on 28/08/2022.
//

import UIKit

let data = Voivodship.data
class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VoivodshipCell", for: indexPath)
        var listConfig = cell.defaultContentConfiguration()
        
        listConfig.text = data[indexPath.row].name
        listConfig.image = UIImage(named: data[indexPath.row].imageName)
        listConfig.imageProperties.maximumSize = CGSize(width: 100, height: 100)
        listConfig.imageProperties.cornerRadius = 20
        
        cell.contentConfiguration = listConfig
        
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "VoivodshipCell")
        tableView.dataSource = self
    }


}


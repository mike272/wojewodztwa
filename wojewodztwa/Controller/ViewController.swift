//
//  ViewController.swift
//  wojewodztwa
//
//  Created by Wojciech Babinski on 28/08/2022.
//

import UIKit
import RxDataSources
import RxSwift

class ViewController: UIViewController {
    
    //data source providing cells
    let dataSource = RxTableViewSectionedReloadDataSource<SectionOfVoivodships>(
        configureCell: {
            dataSource, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "VoivodshipCell", for:  indexPath)
            //getting default config for cell
            var listConfig = cell.defaultContentConfiguration()
            //modifying cell config
            listConfig.text = item.name
            listConfig.image = UIImage(named: item.imageName)
            listConfig.imageProperties.maximumSize = CGSize(width: 100,height: 100)
            //returning new config to cell
            cell.contentConfiguration = listConfig
            return cell
        })
    
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //get filter criteria
        let searchFilter = searchBar.rx.text.orEmpty.debounce(.milliseconds(500), scheduler: MainScheduler.instance).distinctUntilChanged()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "VoivodshipCell")
        
        Observable.combineLatest(Observable.just(dataFromModel), searchFilter)
            .map{
                filteredVoivodships(filter: $0.1)
            }.bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        
        
    }
    
    
    
}


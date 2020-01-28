//
//  ViewController.swift
//  Qosi
//
//  Created by owee on 28/01/2020.
//  Copyright © 2020 owee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var data : [String] = ["1","2","3"]
    
    let webservice = RandomUserService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.webservice.load(number: 5) { (user, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            self.data = user.map({$0.email})
            self.tableView.reloadData()
            
        }
    }
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            fatalError()
        }
        
        cell.textLabel?.text = self.data[indexPath.row]
        return cell
    }
    
}

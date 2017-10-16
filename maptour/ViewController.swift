//
//  ViewController.swift
//  maptour
//
//  Created by D7703_29 on 2017. 10. 12..
//  Copyright © 2017년 D7703_29. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var table: UITableView!

    var content = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = Bundle.main.path(forResource: "data", ofType: "plist")
        table.delegate = self
        table.dataSource = self
        content = NSArray(contentsOfFile: path!)!
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let myTitle = (content[indexPath.row] as AnyObject).value(forKey: "title")
        let myAddress = (content[indexPath.row] as AnyObject).value(forKey: "address")
        
        
        myCell.textLabel?.text = myTitle as? String
        myCell.detailTextLabel?.text = myAddress as? String
        
        return myCell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gopin" {
            let post = segue.destination as? pinViewController
            let post2 = segue.destination as? pinViewController
            // 테이블뷰에서 선택한 indexPath.row
            let selectedPath = table.indexPathForSelectedRow
            post?.pinaddress = (content[(selectedPath?.row)!] as AnyObject).value(forKey: "address") as? String
            post2?.pintitle = (content[(selectedPath?.row)!] as AnyObject).value(forKey: "title") as? String
            
        }
    }

}


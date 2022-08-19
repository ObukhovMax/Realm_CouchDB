import UIKit
import Foundation
import RealmSwift
import Alamofire

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var changesCount: UILabel!
    @IBOutlet weak var recordsCount: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    
    var dbProtocolData : [Displayable] = []
    
    let realm = try! Realm()
    var tableList: Results<MyTable> {
        get {
            return realm.objects(MyTable.self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CustomTableCell", bundle: nil)
        myTableView.register(nib, forCellReuseIdentifier: "CustomTableCell")
        myTableView.rowHeight = UITableView.automaticDimension
        myTableView.estimatedRowHeight = 600
        fetchDB()
        printLocation()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableCell", for: indexPath) as! CustomTableCell
        let item = tableList[indexPath.row]
        cell.idLabel.text = String(item.iD)
        cell.countOfChangesLabel.text = String(item.changeNumber)
        cell.docBodyLabel.text = item.docBody
//        cell.docBodyLabel.text = dbProtocolData[indexPath.row].docDict.docBodyText
        recordsCount.text = "Records: " + String(tableList.count)
        return cell
    }
    
    func printLocation() {
        print("User Realm User file location: \(realm.configuration.fileURL!.path)")
    }
}

extension TableViewController {
    func fetchDB() {
        AF.request("http://127.0.0.1:5984/test/_all_docs?include_docs=true")
        //login: admin, password: passworddd9
        //url = http://127.0.0.1:5984/test/_changes?_feed=continuous&_heartbeat=30000&_since=now
        //_changes: _feed?=continuous, _heartbeat?=30000, _since?=now
            .validate()
            .responseDecodable(of: Welcome.self) { (response)  in
                guard let dbData = response.value else { return }
                self.dbProtocolData = dbData.rows
                for i in self.dbProtocolData.indices {
                    print(self.dbProtocolData[i].docDict.docBodyText)
                    print(self.dbProtocolData[i].docDict.changeNumberText)
                    print(self.dbProtocolData[i].docDict.idText)
                }
                
            }
    }
}

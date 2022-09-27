//
//  ForgotPasswordViewController.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 16/9/22.
//

import UIKit


struct AmiiboList: Codable {
    let amiibo:[Amiibo]
}

struct Amiibo: Codable {
    let amiiboSeries: String?
    let character: String?
    let gameSeries: String?
    let head: String?
    let image : String?
    let name : String?
    let release: AmiiboRelease
    let tail: String?
    let type: String?
}
struct AmiiboRelease: Codable {
    let au: String?
    let eu: String?
    let jp: String?
    let na: String?
}

//struct ToDo: Codable {
//  let userId: Int
//  let id: Int
//  let title: String
//  let isComplete: Bool
//
//  enum CodingKeys: String, CodingKey {
//    case isComplete = "completed"
//    case userId, id, title
//  }
//}

class ForgotPasswordViewController: UIViewController {

    var dataSetImage = [String]()
    var dataSetName = [String]()
    
   var tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self,forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableViewConstraints()
        fetchData()
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        }
   @objc private func didPullToRefresh() {
        print("Start")
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
        }
    }
    
    private func fetchData(){

        let url = URL(string:"https://amiiboapi.com/api/amiibo/?name=mario")!
        
        let task = URLSession.shared.dataTask(with: url)
        { (data, resp, error) in

            guard let data = data else {
                print("data wan nil")
                return
            }
            guard let amiiboList = try? JSONDecoder().decode(AmiiboList.self, from: data)else {
                print("couldn't")
                return
            }
            
            for i in 0...amiiboList.amiibo.count-1  {
                self.dataSetImage.append(amiiboList.amiibo[i].image!)
                self.dataSetName.append(amiiboList.amiibo[i].name!)
            }
            //self.dataSet.append("Character - \(amiiboList.amiibo.map{$0.character})")
                //self.dataSet.append("Character2")
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    
    }
    
    func tableViewConstraints() {
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}

extension ForgotPasswordViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSetName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for:indexPath)
        cell.textLabel?.text = dataSetName[indexPath.row]
              let url = URL(string: "\(dataSetImage[indexPath.row])")!
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url){
                DispatchQueue.main.async {
                    cell.imageView?.image = UIImage(data: data)
                }
            }
        }
       
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}



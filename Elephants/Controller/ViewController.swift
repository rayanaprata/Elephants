//
//  ViewController.swift
//  Elephants
//
//  Created by Rayana Prata Neves on 18/10/21.
//

import UIKit

class ViewController: UIViewController {

    var elephants: [Elephant] = []
    var tableViewListElephants = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        pra popular a tabela vamos precisar de:
//        image, name, note -> lembrar de dar um reloadData na tabela pra ele executar e popular certinho
        
        self.tableViewListElephants.frame = self.view.bounds
        self.tableViewListElephants.dataSource = self
        self.tableViewListElephants.delegate = self
        self.view.addSubview(self.tableViewListElephants)
        
//        executando a requisicao:
        let url = API().setElephantsURL()
        self.elephants = API().getElephants(urlString: url, method: .GET)
        
        tableViewListElephants.reloadData()
        print("Quantidade de elefantes: ", self.elephants.count)
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.elephants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = self.elephants[indexPath.row].name
        cell.detailTextLabel?.text = self.elephants[indexPath.row].note
        
        cell.detailTextLabel?.adjustsFontSizeToFitWidth = false
        cell.detailTextLabel?.numberOfLines = 0
        
        
        if let image = self.elephants[indexPath.row].image {
            let url = URL(string: image)
            let data = try? Data(contentsOf: url!)
            cell.imageView?.image = UIImage(data: data!)
        }
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                let detail = DetailViewController()
                detail.elephant = self.elephants[indexPath.row]
        
        //        self.show(detail, sender: nil)
                self.showDetailViewController(detail, sender: nil)
    }
}

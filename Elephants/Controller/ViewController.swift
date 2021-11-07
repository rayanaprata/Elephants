//
//  ViewController.swift
//  Elephants
//
//  Created by Rayana Prata Neves on 18/10/21.
//

import UIKit

class ViewController: UIViewController {

    let api = API()
    var elephants: [Elephant] = []
    var tableViewListElephants = UITableView()
    
    var reuseIdentifier = "CelulaElephantTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        pra popular a tabela vamos precisar de:
//        image, name, note -> lembrar de dar um reloadData na tabela pra ele executar e popular certinho
        
        self.tableViewListElephants.frame = self.view.bounds
        self.tableViewListElephants.dataSource = self
        self.tableViewListElephants.delegate = self
        
        let nib = UINib(nibName: "CelulaElephantTableViewCell", bundle: nil)
        self.tableViewListElephants.register(nib, forCellReuseIdentifier: reuseIdentifier)
            
        self.view.addSubview(self.tableViewListElephants)
        
//        executando a requisicao:
        let url = api.setElephantsURL()
        api.getElephants(urlString: url, method: .GET, response: { elephantsReturned in
            self.elephants = elephantsReturned
            DispatchQueue.main.async {
                print("Quantidade de elefantes: ", self.elephants.count)
                self.tableViewListElephants.reloadData()
            }
        }, errorReturned: { errorMessage in
            print("\(errorMessage)")
        })
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.elephants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CelulaElephantTableViewCell
        
        cell?.labelTitle.text = self.elephants[indexPath.row].name
        cell?.labelDescription.text = self.elephants[indexPath.row].note

        cell?.labelDescription.adjustsFontSizeToFitWidth = false
        cell?.labelDescription.numberOfLines = 0
        
        if let image = self.elephants[indexPath.row].image {
            let url = URL(string: image)
            let data = try? Data(contentsOf: url!)
            cell?.imageElephant?.image = UIImage(data: data!)
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
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

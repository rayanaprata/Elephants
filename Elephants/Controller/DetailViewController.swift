//
//  DetailViewController.swift
//  Elephants
//
//  Created by Rayana Prata Neves on 18/10/21.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    var elephant: Elephant = Elephant()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Elefante tocado: \(elephant.name)")
        
//        setupUI()
    }
    
//    func setupUI() {
//        print("Elefante tocado: \(elephant.name)")
//    }
//
}

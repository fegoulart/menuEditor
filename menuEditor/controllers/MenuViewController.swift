//
//  MenuViewController.swift
//  menuEditor
//
//  Created by Fernando Goulart on 24/06/2018.
//  Copyright © 2018 Leapi. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var myDishes : [Dish] = []
    let dish1 = Dish(dishId: 1, dishName: "Chinese Food", dishDescription: "Delicious Chinese Food", dishPrice: 15.35, dishImage: UIImage(named: "dish1")!)
    let dish2 = Dish(dishId: 2, dishName: "Beef", dishDescription: "Delicious Beef", dishPrice: 25.95, dishImage: UIImage(named: "dish2")!)
    let dish3 = Dish(dishId: 3, dishName: "Brazilian Food", dishDescription: "Feijoada", dishPrice: 45.35, dishImage: UIImage(named: "dish3")!)
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var mainSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var dishTableView: UITableView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dishTableView.register(UINib(nibName: "DishTableViewCell", bundle: nil) , forCellReuseIdentifier: "dishCell")
        
        //SegmentControl
        self.mainSegmentedControl.addTarget(self, action: #selector(self.segmentControlClick(_:)) , for: .valueChanged)
        
        self.myDishes.append(self.dish1)
        self.myDishes.append(self.dish2)
        self.myDishes.append(self.dish3)
        
        self.dishTableView.delegate = self
        self.dishTableView.dataSource = self
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
   
    
    @objc func segmentControlClick(_ sender: UISegmentedControl) {
        
        
        switch sender.selectedSegmentIndex {
        case 0:
            _ = navigationController?.popViewController(animated: false)
            
            break
        case 1:
            
            break
        default:
            
            
            
            break
        }
        
    }
    
    // MARK: - TableView Delegate and Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TO-DO Separate types of dishes in sections. Eg: Appetizes, Desserts, etc
        return myDishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dishCell", for: indexPath) as! DishTableViewCell
        
        cell.dishNameUILabel.text = self.myDishes[indexPath.item].dishName
        cell.dishImageView.image = self.myDishes[indexPath.item].dishImage
        cell.dishDescriptionUiLabel.text = self.myDishes[indexPath.item].dishDescription
        cell.dishPriceUILabel.text = self.myDishes[indexPath.item].dishPrice.retornaValorFinanceiro()
        
        return cell
        
    }

}

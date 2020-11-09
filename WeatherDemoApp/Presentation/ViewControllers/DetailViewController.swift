//
//  DetailViewController.swift
//  WeatherDemoApp
//
//  Created by Naeem Paracha on 09/11/2020.
//  Copyright © 2020 Naeem Paracha. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var tableView:UITableView!
    
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

    let viewModel = ForecastViewModel()
    
    var displayHourlyForecast: [Current] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    

}



extension DetailViewController : UITableViewDataSource , UITableViewDelegate{
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayHourlyForecast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherForecastCustomHourCell", for: indexPath) as! WeatherForecastCustomCell
        cell.setUpHourlyCellData(hourlyViewModel: HourlyViewModel(model: displayHourlyForecast[indexPath.row]))
        return cell
    }
    

}


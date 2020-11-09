//
//  ViewController.swift
//  WeatherDemoApp
//
//  Created by Naeem Paracha on 09/11/2020.
//  Copyright © 2020 Naeem Paracha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    let viewModel = ForecastViewModel()
    
    var displayDailyForecast: [Daily] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var displayHourlyForecast: [Current] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let tempUnit = Utils.getUnit()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: tempUnit, style: .plain, target: self, action: #selector(changeUnit))
        
        viewModel.delegate = self
        viewModel.locationPermession()
        addActivityIndicatory()
        activityIndicator.startAnimating()
        
    }
    
    
    
    
    @objc func changeUnit(){
        
        let tempUnit = Utils.unitChanged()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: tempUnit, style: .plain, target: self, action: #selector(changeUnit))
        viewModel.locationPermession()
        addActivityIndicatory()
        activityIndicator.startAnimating()
    }
    
    
    /// Added Activity Indicatory
    func addActivityIndicatory() {
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        if #available(iOS 13.0, *) {
            activityIndicator.style = .large
        } else {
            activityIndicator.style = .whiteLarge
        }
        self.view.addSubview(activityIndicator)
    }
    
}


extension ViewController : UITableViewDataSource , UITableViewDelegate{
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayDailyForecast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherForecastCustomCell", for: indexPath) as! WeatherForecastCustomCell
        cell.setUpDailyCellData(dailyViewModel: DailyWeatherViewModel(model: displayDailyForecast[indexPath.row]))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowDetailViewController", sender: self)
    }
}

extension ViewController : ForecastViewModelProtocol {
    
    func displayWeatherData(forecast: Forecast) {
        LocalNotificationManager.sharedInstance.scheduleNotifications(title: "Weather Forecast", body:"Weather forecast has been updated")
        self.title = forecast.timezone ?? "Weather Forecast"
        displayDailyForecast = forecast.daily ?? []
        displayHourlyForecast = forecast.hourly ?? []
        activityIndicator.stopAnimating()
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailViewController" {
            let detailVC = segue.destination as? DetailViewController
            detailVC?.displayHourlyForecast = displayHourlyForecast
        }
    }
    
}

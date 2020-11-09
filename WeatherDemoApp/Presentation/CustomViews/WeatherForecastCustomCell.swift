//
//  WeatherForecastCustomCell.swift
//  WeatherDemoApp
//
//  Created by Naeem Paracha on 09/11/2020.
//  Copyright © 2020 Naeem Paracha. All rights reserved.
//

import UIKit
import AlamofireImage

class WeatherForecastCustomCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet weak var dayTimeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherInfoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpDailyCellData(dailyViewModel: DailyWeatherViewModel) {
        temperatureLabel.text =  dailyViewModel.temperature
        dayTimeLabel.text = dailyViewModel.day
        weatherInfoImage.af.setImage(withURL: (dailyViewModel.iconUrl2x!))
    }
    
    func setUpHourlyCellData(hourlyViewModel: HourlyViewModel) {
        temperatureLabel.text =  "\(hourlyViewModel.temperature) \n \(hourlyViewModel.feelLike)"
        dayTimeLabel.text = hourlyViewModel.time
        weatherInfoImage.af.setImage(withURL: (hourlyViewModel.iconUrl2x!))
    }

}

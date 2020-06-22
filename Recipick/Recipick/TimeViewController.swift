//
//  TimeViewController.swift
//  Recipick
//
//  Created by ParkDongHyuck on 2017. 5. 25..
//  Copyright © 2017년 ChefKim. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController {

    @IBOutlet weak var TimeListTable: UITableView!
    
    let timeListEnum = [Recipe.Time.M10, Recipe.Time.M30, Recipe.Time.H1, Recipe.Time.H2, Recipe.Time.H3, Recipe.Time.Day]
    let timelist = ["10분 내외", "30분 내외", "1시간", "2시간", "3시간 이상", "하루 이상"]
    let images = ["10m", "30m", "1h", "2h", "3h", "1d"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        TimeListTable.dataSource = self
        TimeListTable.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TimeToTag" {
            if let toTag = segue.destination as? TagViewController {
                var tagList:[Recipe]
                if let indexPath = TimeListTable.indexPathForSelectedRow {
                    tagList = recipeList.filter { $0.time == timeListEnum[indexPath.row] }
                    
                    toTag.tagList = tagList
                    toTag.tagTitle = timeListEnum[indexPath.row].toString()
                }
                
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TimeViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timelist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TimeListTable.dequeueReusableCell(withIdentifier: "TimeListCell", for: indexPath) as! TimeListCell
        
        cell.TimeCellLabel.text = timelist[indexPath.row]
        cell.TimeCellImage.image = UIImage(named: "icon_time_" + images[indexPath.row])
        
        return cell } }

extension TimeViewController: UITableViewDelegate{ }

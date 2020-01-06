//
//  ViewController.swift
//  Project1
//
//  Created by Montana  on 9/30/19.
//  Copyright © 2019 Montana . All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // declares constant fn and assigns it the value returned by FileManager.default
        let fm = FileManager.default
        // declares a constant called path that sets the resource path of our apps bundle
        let path = Bundle.main.resourcePath!
        // make new constant called items and set it to the contents of the directory at a path (one returned from the line before)
        let items = try! fm.contentsOfDirectory(atPath: path)
        
       // appends photos and sorts it with the prefix nssl
        for item in items{
            if item.hasPrefix("nssl") {
                //this is a picture to load
                pictures.append(item)
                pictures.sort()
            }
    
        }
        
        print(pictures)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.totalPictures = pictures.count
            vc.selectedPictureNumber = indexPath.row + 1
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

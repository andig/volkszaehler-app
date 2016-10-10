//
//  TableViewControllerMiddleware.swift
//  volkszaehler
//
//  Created by Andreas Götz on 08/10/2016.
//  Copyright © 2016 Andreas Götz. All rights reserved.
//

import UIKit

class ChannelTableViewController: UITableViewController {
    
    var middleware: Middleware!
//    var channels = [Channel]()
    
    // MARK: actions
    
    @IBAction func unwindToChannelList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ChannelViewController {
            let channel = sourceViewController.channel!
            let newIndexPath = IndexPath(row: middleware.channels.count, section: 0)
            middleware.channels.append(channel)
            tableView.insertRows(at: [newIndexPath], with: .bottom)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "EditChannels" {
//            if let selectedCell = sender as? MiddlewareTableViewCell {
//                let tableView = selectedCell.superview as! UITableView
//                let middlewareTableViewController = tableView.delegate as! MiddlewareTableViewController
//                
//                let indexPath = tableView.indexPath(for: selectedCell)!
//                let middleware = middlewareTableViewController.middlewares[indexPath.row]
//                
//                middleware.loadChannels()
//                channels = middleware.channels
//            }
//        }
    }
    
    func setMiddleware(_ middleware: Middleware) {
        self.middleware = middleware
//        middleware.loadChannels()
    }
    
    // MARK: main
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        loadChannels()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

//    func loadChannels() {
//        let channel = Channel(uuid: "0815-4711")
//        channels += [channel]
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return middleware.channels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ChannelTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ChannelTableViewCell", for: indexPath) as! ChannelTableViewCell
        
        let channel = middleware.channels[indexPath.row]
        cell.uuidLabel.text = channel.uuid
        cell.titleLabel.text = channel.title

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
}

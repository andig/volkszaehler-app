//
//  TableViewControllerMiddleware.swift
//  volkszaehler
//
//  Created by Andreas Götz on 08/10/2016.
//  Copyright © 2016 Andreas Götz. All rights reserved.
//

import UIKit

class MiddlewareTableViewController: UITableViewController {

    var middlewares = [Middleware]()
    
    // MARK: actions
    
    @IBAction func unwindToMiddlewareList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? MiddlewareViewController {
            let middleware = sourceViewController.middleware
            let newIndexPath = IndexPath(row: middlewares.count, section: 0)
            middlewares.append(middleware!)
            tableView.insertRows(at: [newIndexPath], with: .bottom)
        }
    }
    
    // MARK: navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditChannels" {
            if let navController = segue.destination as? UINavigationController {
                if let channelTableViewController = navController.topViewController as? ChannelTableViewController {
                    
                    if let selectedCell = sender as? MiddlewareTableViewCell {
                        let indexPath = tableView.indexPath(for: selectedCell)!
                        let middleware = middlewares[indexPath.row]
                        
                        channelTableViewController.setMiddleware(middleware)
                    }
                }
                
            }
        }
    }
    
    // MARK: main
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (middlewares.count == 0) {
            loadMiddlewares()
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    func loadMiddlewares() {
        let demo = Middleware(name: "Volkszaehler Demo", uri: "http://demo.volkszaehler.org/middleware.php")
        demo.loadChannels()
            
        middlewares += [demo]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return middlewares.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MiddlewareTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MiddlewareTableViewCell", for: indexPath) as! MiddlewareTableViewCell

        let middleware = middlewares[indexPath.row]
        cell.nameLabel.text = middleware.name

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

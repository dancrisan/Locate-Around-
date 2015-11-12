//
//  MentorsViewController.swift
//  WhosHome
//
//  Created by Dan Crisan on 2015-11-12.
//  Copyright © 2015 davik. All rights reserved.
//

//
//  TableViewController.swift
//  WhosHome
//
//  Created by Dan Crisan on 2015-11-08.
//  Copyright © 2015 davik. All rights reserved.
//

import Foundation
import Parse
import UIKit

class MentorsViewController: PFQueryTableViewController, ESTBeaconManagerDelegate {
    
//    let beaconManager = ESTBeaconManager()
//    let beacon = ESTBeacon()
    var someInts = [Int]()
    var tField: UITextField!
    var mainBeaconName = ""
    //    var minor = 0
    
    
    //    @IBOutlet var whiteBackground: UILabel!
    
    
    // Initialise the PFQueryTable tableview
    override init(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: 0x55708d)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.tableView.backgroundColor = UIColor(hex: 0x55708d)
        
        self.tableView.rowHeight = 75.0
        
        self.navigationController?.navigationBarHidden = false

        
        //        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
        
        
        //        print(isBeacon(beacon_C));
        //        print(beacon_C.major);
        
        //        print(beacon.proximityUUID!.UUIDString)
        //        var gameScoreObject = PFObject(className:"ExampleData")
        //        var query = PFQuery(className:"ExampleData")
        //        query.getObjectInBackgroundWithId("765765") {
        //            (ExampleData: PFObject?, error: NSError?) -> Void in
        //            if error == nil && ExampleData != nil {
        //                print("yee!")
        //                print(ExampleData)
        //            } else {
        //                print("!fuck")
        //                print(error)
        //            }
        //        }
    }
    
    
    
    required init!(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Configure the PFQueryTableView
        self.parseClassName = "ExampleData"
        self.textKey = "nameEnglish"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
    
    // Define the query that will provide the data for the table view
    override func queryForTable() -> PFQuery {
        var query = PFQuery(className: "ExampleData")
        query.orderByDescending("updatedAt")
        //        print("2");
        return query
        
    }
    
    //override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell {
        
        
        
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! PFTableViewCell!
        if cell == nil {
            cell = PFTableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        }
        

        
        
        let activityStatus = String(object!["status"]!)
        print(activityStatus)
        print(String(object!["proximity"]!))
        
        if(activityStatus == "Active"){
            var imageView = UIImageView(frame: CGRectMake(10, 10, cell.frame.width + 30, cell.frame.height + 10))
            let image = UIImage(named: "cellBackground.jpg")
            imageView.image = image
            cell.backgroundView = UIView()
            cell.backgroundView!.addSubview(imageView)
            
            // Extract values from the PFObject to display in the table cell
//            let minorID = object?["minor"]
//            let majorID = object?["major"]
            //        let beaconID = minorID + "-" + majorID
//            cell?.textLabel?.text = "Beacon ID : " + String(minorID!) + "-" + String(majorID!)
            cell?.textLabel?.text = String(object!["mainBeaconName"]!)
            mainBeaconName = (cell?.textLabel?.text)!;
            
            //        if let nameEnglish = object?["minor"] {
            //            cell?.textLabel?.text = String(nameEnglish)
            //        }
            if let capital = object?["proximity"] as? String {
                cell?.detailTextLabel?.text = capital
                cell?.detailTextLabel?.backgroundColor = UIColor.whiteColor();
                //            cell?.detailTextLabel?.text = "huhuhu"
            }
            
            //        var newLabel = UILabel(frame: CGRectMake(30.0, 30.0, 30.0, 10.0))
            //        newLabel.text = "HEELLLOOOO BOB"
            
            //        whiteBackground.addSubview(newLabel);
            //        cell.view
            //        cell.addSubview(newLabel);
        }
        
        return cell
        print("1");

    }
    
    override func viewDidAppear(animated: Bool) {
        print("4");
        //        var query = PFQuery(className:"ExampleData")
        //        query.whereKey("objectId", equalTo:PFUser.currentUser()!.objectId)
        // Refresh the table to ensure any data changes are displayed
        //        tableView.reloadData()
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //
    //        // Get the new view controller using [segue destinationViewController].
    //        var detailScene = segue.destinationViewController as! MainWindow
    
    //        navigationItem.title = nil
    //        navigationItem.backBarButtonItem
    //         self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Bob", style: .Plain, target: nil, action: nil)
    //        navigationItem.backBarButtonItem = true
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    //    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        cell.backgroundColor = UIColor(hex: 0x55708d)
        //cell.backgroundColor = UIColor.whiteColor()
        
    }
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //CODE TO BE RUN ON CELL TOUCH
        //        let alertController = UIAlertController(title: "iOScreator", message:
        //            "Hello, world!", preferredStyle: UIAlertControllerStyle.Alert)
        //        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default,handler: nil))
        
        // Create the alert controller
//        var cell = tableView.cellForRowAtIndexPath(tableView.indexPathForSelectedRow!)
//        
//        var alertController = UIAlertController(title: cell?.textLabel?.text!, message: cell?.detailTextLabel?.text, preferredStyle: .Alert)
//        
//        var cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) {
//            UIAlertAction in
//            NSLog("Cancel Pressed")
//        }
//        
//        var doneAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default) {
//            UIAlertAction in
//            NSLog("Done Pressed")
//            print("hiii");
//            
//            //            self.editValue(self.findObjID((cell?.textLabel?.text!)!, inThisColumn: "mainBeaconName", fromThisDB: "ExampleData"), fromThisColumn: "mainBeaconName", withThisText: String(self.tField))
//            //            print(self.findObjID((cell?.textLabel?.text!)!, inThisColumn: "mainBeaconName", fromThisDB: "ExampleData"))
//            //            var objID = "";
//            //            var query = PFQuery(className: "ExampleData")
//            //            query.whereKey("minor", equalTo: "234")
//            //            query.findObjectsInBackgroundWithBlock {
//            //                (objects: [PFObject]?, error: NSError?) -> Void in
//            //                if (error == nil && objects != nil){
//            //                    for object in objects! {
//            //                        objID = object.objectId!
//            //                        print("woooohooo")
//            //                        print(objID);
//            //                    }
//            //                }
//            //            }
//            
//            var currentBeaconName = ((cell?.textLabel?.text!)!).stringByReplacingOccurrencesOfString("Beacon ID : ", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
//            print("this is magic")
//            print(currentBeaconName)
//            
//            var messages = NSArray()
//            var fuckingObjectID = "hey"
//            
//            print("MAKE IT WORK!!")
//            print("This is the current beacon name " + currentBeaconName)
//            print(self.tField.text!)
//            //            var query = PFQuery(className: "ExampleData")
//            //            query.whereKey("mainBeaconName", equalTo: currentBeaconName)
//            //            query.findObjectsInBackgroundWithBlock { (object, error) -> Void in
//            //                if error == nil {
//            //                    print("CAN YOU F WORK");
//            //                    print(object)
//            //                }
//            //                else {
//            //                    print(error)
//            //                }
//            //
//            //            }
//            var query = PFQuery(className: "ExampleData")
//            query.whereKey("mainBeaconName", equalTo: currentBeaconName)
//            do {
//                messages = try query.findObjects()
//                print(messages);
//            } catch _ {
//                print("Error ocqurence when obtain other user list")
//            }
//            
//            for message in messages {
//                print(message.objectId!! as String)
//                fuckingObjectID = message.objectId!! as String
//            }
//            //            query.cancel()
//            ////            print
//            //
//            //            print(self.tField.text)
//            print("plz...")
//            print(fuckingObjectID)
//            var query2 = PFQuery(className:"ExampleData")
//            query2.getObjectInBackgroundWithId(fuckingObjectID) {
//                (object, error) -> Void in
//                if error != nil {
//                    print(error)
//                } else {
//                    if let object = object {
//                        object["mainBeaconName"] = self.tField.text!
//                    }
//                    object!.saveInBackground()
//                }
//            }
//            
//            currentBeaconName = self.tField.text!
//            cell?.textLabel?.text = "Beacon ID : " + currentBeaconName;
//            
//            
//            
//            //            var objID = ""
//            //
//            //            var query2 = PFQuery(className:"ExampleData")
//            //            query2.whereKey("mainBeaconName", equalTo:currentBeaconName)
//            //
//            //
//            //            do {
//            //                var obj = try query2.findObjects()
//            ////                print(obj)
//            //
//            //            } catch _ {
//            //                print("Error ocqurence when obtain other user list")
//            //            }
//            
//            
//            //            do {
//            //            var objects = try query2.findObjects()
//            //                        } catch _ {
//            //                            MessageAlert.errorAlert("Error ocqurence when obtain other user list")
//            //                        }
//            //            print(objects)
//            //            print(query2["capital"]);
//            //            query2.findObjects() as! [PFObject]
//            //            query2.findObjectsInBackgroundWithBlock {
//            //                (objects: [PFObject]?, error: NSError?) -> Void in
//            //
//            //
//            //                if (error == nil && objects != nil){
//            ////                    completion(result: objects!);
//            //                    print(objects)
//            //                    for object in objects! {
//            //                        objID = object.objectId!
//            //                        print("fuck!");
//            //                        print(object.objectId!)
//            //                        print("you!");
//            //                        print(objID)
//            //                        print("thanks!");
//            //                    }
//            ////                    print(objects![4])
//            //                }
//            //
//            //            }
//            
//            //            sleep(5);
//            //
//            //            print("cacaolait!!!")
//            ////            print(objID);
//            //            var query = PFQuery(className:"ExampleData")
//            //            query.getObjectInBackgroundWithId(objID) {
//            ////                (gameScore: PFObject?, error: NSError?) -> Void in
//            ////                if error == nil && gameScore != nil {
//            ////                    print(gameScore)
//            ////                } else {
//            ////                    print(error)
//            ////                }
//            //                (rowObject: PFObject?, error: NSError?) -> Void in
//            //                if error != nil {
//            //                    print(error)
//            //                } else if let rowObject = rowObject {
//            //                    rowObject["nameLocal"] = "hihihi"
//            //                    rowObject["capital"] = "bleh"
//            //                    rowObject.saveInBackground()
//            //                }
//            //            }
//            
//            
//        }
//        
//        
//        // Create the actions
//        var renameAction = UIAlertAction(title: "Rename", style: UIAlertActionStyle.Default) {
//            UIAlertAction in
//            NSLog("Rename Pressed")
//            
//            //            var alertController2 = UIAlertController(title: cell?.textLabel?.text!, message: cell?.detailTextLabel?.text, preferredStyle: .Alert)
//            //
//            //            let textField = (alertController2.textFields?.first?)? as UITextField
//            
//            //            let textField = alertController2.textFields;
//            
//            //            self.presentViewController(alertController2, animated: true, completion: nil)
//            
//            var alert = UIAlertController(title: cell?.textLabel?.text!, message: "is renamed to:", preferredStyle: UIAlertControllerStyle.Alert)
//            
//            alert.addTextFieldWithConfigurationHandler(self.configurationTextField)
//            //            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler:handleCancel))
//            
//            
//            
//            alert.addAction(doneAction);
//            alert.addAction(cancelAction);
//            
//            self.presentViewController(alert, animated: true, completion: {
//                print("completion block")
//            })
//            
//        }
//        var connectAction = UIAlertAction(title: "Connect", style: UIAlertActionStyle.Default) {
//            UIAlertAction in
//            NSLog("Connect Pressed")
//            
//            
//            var currentBeaconName = ((cell?.textLabel?.text!)!).stringByReplacingOccurrencesOfString("Beacon ID : ", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
//            print("OK LETS SEE WHAT THIS IS NOW!")
//            print(currentBeaconName)
//            
//            var messages = NSArray()
//            var fuckingObjectID = "hey"
//            
//            print("MAKE IT WORK!!")
//            print(self.tField.text!)
//            //            var query = PFQuery(className: "ExampleData")
//            //            query.whereKey("mainBeaconName", equalTo: currentBeaconName)
//            //            query.findObjectsInBackgroundWithBlock { (object, error) -> Void in
//            //                if error == nil {
//            //                    print("CAN YOU F WORK");
//            //                    print(object)
//            //                }
//            //                else {
//            //                    print(error)
//            //                }
//            //
//            //            }
//            var query = PFQuery(className: "ExampleData")
//            query.whereKey("mainBeaconName", equalTo: currentBeaconName)
//            do {
//                messages = try query.findObjects()
//                print(messages);
//            } catch _ {
//                print("Error ocqurence when obtain other user list")
//            }
//            
//            for message in messages {
//                print(message.objectId!! as String)
//                fuckingObjectID = message.objectId!! as String
//            }
//            //            query.cancel()
//            ////            print
//            //
//            //            print(self.tField.text)
//            print("plz...")
//            print("OKAY THIS IS THE SECOND TIME WE GET THE PROPER KEY!")
//            print(fuckingObjectID)
//            var query2 = PFQuery(className:"ExampleData")
//            query2.getObjectInBackgroundWithId(fuckingObjectID) {
//                (object, error) -> Void in
//                if error != nil {
//                    print(error)
//                } else {
//                    if let object = object {
//                        object["status"] = "Active"
//                    }
//                    object!.saveInBackground()
//                }
//            }
//            
//            //            currentBeaconName = self.tField.text!
//            cell?.detailTextLabel?.text = "Active"
//            
//            
//            
//            
//            
//            
//            
//            
//            
//        }
//        
//        
//        // Add the actions
//        alertController.addAction(renameAction)
//        alertController.addAction(connectAction)
//        alertController.addAction(cancelAction)
//        
//        self.presentViewController(alertController, animated: true, completion: nil)
//    }
//    
    
    
//    func configurationTextField(textField: UITextField!)
//    {
//        print("generating the TextField")
//        textField.placeholder = "Enter person of interest name"
//        print("I WOULD LOVE TO BE HEALTHY");
//        print(textField.text!);
//        tField = textField
//    }
//    
//    //find objectID of given element
//    func findObjID(ofThisElement: String, inThisColumn: String, fromThisDB: String ) -> String{
//        
//        var objID = ""
//        
//        var query = PFQuery(className: fromThisDB)
//        query.whereKey(inThisColumn, equalTo: ofThisElement)
//        query.findObjectsInBackgroundWithBlock {
//            (objects: [PFObject]?, error: NSError?) -> Void in
//            if (error == nil && objects != nil){
//                for object in objects! {
//                    objID = object.objectId!
//                }
//            }
//        }
//        
//        return objID;
//    }
//    
//    func editValue(fromThisObjID: String, fromThisColumn: String, withThisText: String){
//        var query = PFQuery(className:"ExampleData")
//        query.getObjectInBackgroundWithId(fromThisObjID) {
//            //                (gameScore: PFObject?, error: NSError?) -> Void in
//            //                if error == nil && gameScore != nil {
//            //                    print(gameScore)
//            //                } else {
//            //                    print(error)
//            //                }
//            (rowObject: PFObject?, error: NSError?) -> Void in
//            if error != nil {
//                print(error)
//            } else if let rowObject = rowObject {
//                rowObject[fromThisColumn] = withThisText
//                //                rowObject["capital"] = "yolooo"
//                rowObject.saveInBackground()
//            }
//        }
//    }
//    
//    static func obtainFriendsList( roomData : [PFObject] ) {
//        let query = PFQuery(className: "PeopleInRoom")
//        query.whereKey("room", containedIn: roomData)
//        query.includeKey("people")
//        query.includeKey("room")
//        do {
//            var hello = try query.findObjects()
//        } catch _ {
//            print("Error ocqurence when obtain other user list")
//        }
//    }
    
    
}

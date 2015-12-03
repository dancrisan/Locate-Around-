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

class TableViewController: PFQueryTableViewController, ESTBeaconManagerDelegate {

    let beaconManager = ESTBeaconManager()
    let beacon = ESTBeacon()
    var someInts = [Int]()
    var tField: UITextField!
    var mainBeaconName = ""
    let emptyImageView = UIImageView(frame: CGRectMake(20, 20, 400, 400));
    //let imageEmpty = UIImage(named: "noBeacon.png")
    //let imageEmpty = UIImage(named: "emptyState1.png");
    //let imageEmpty = UIImage(named: "emptyState2.png");
    //let imageEmpty = UIImage(named: "emptyState3.png");
    //let imageEmpty = UIImage(named: "emptyState4.png");
    //let imageEmpty = UIImage(named: "emptyState8.png");
    //let imageEmpty = UIImage(named: "emptyState9.png");
    //let imageEmpty = UIImage(named: "emptyState10.png");
    let imageEmpty = UIImage(named: "emptyState11.png");
    var i = 0;
    
    var listOfBeaconNames = [String]();
    
    let oneImageView = UIImageView(frame: CGRectMake(20, 20, 400, 400));
    let imageOne = UIImage(named: "oneState.png")
    
    var numberOfCellsPresent = 0;
    
    // create a new style
    var style = ToastStyle()
    
    // Initialise the PFQueryTable tableview
    override init(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        
        
        self.tableView.rowHeight = 70.0
        self.tableView.separatorStyle = .None
        
        self.navigationController?.navigationBarHidden = false //show navigation bar
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: 0x55708d) //make Navigation bar blue
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        self.tableView.backgroundColor = UIColor(hex: 0x55708d) //set background of the app to blue

        self.refreshControl?.tintColor = UIColor.whiteColor()
        self.refreshControl?.addTarget(self, action: "onPullToFresh", forControlEvents: UIControlEvents.ValueChanged)

        emptyImageView.frame.origin.x = (self.view.bounds.size.width - emptyImageView.frame.size.width) / 2.0;
        emptyImageView.frame.origin.y = (self.view.bounds.size.height - emptyImageView.frame.size.height) / 4.0;
        emptyImageView.image = imageEmpty
        self.tableView.addSubview(emptyImageView)

        
        oneImageView.frame.origin.x = (self.view.bounds.size.width - oneImageView.frame.size.width) / 2.0;
        oneImageView.frame.origin.y = (self.view.bounds.size.height - oneImageView.frame.size.height) / 4.0;
        oneImageView.image = imageOne
        self.tableView.addSubview(oneImageView)
        
        // this is just one of many toast style options
        style.backgroundColor = UIColor(hex: 0x18beae)
        
        let error: NSErrorPointer = nil
        let count = queryForTable().countObjects(error)
        print(count)
        if (count > 0) {
            emptyImageView.hidden = true;
            oneImageView.hidden = true;
            if( count == 1){
                oneImageView.hidden = false;
            }
        }
        else{
            oneImageView.hidden = true;
            emptyImageView.hidden = false;
            self.view.makeToast("Grab a beacon and pull to refresh", duration: 1.5, position: CGPoint(x: self.view.bounds.size.width / 2.0, y: 560.0), style: style)
        }
        
        beaconManager.delegate = self
        let proxID = NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")
        beaconManager.startEstimoteBeaconsDiscoveryForRegion(ESTBeaconRegion(proximityUUID: proxID!, identifier: "Vik's Beacons"))
        
        
    }
    
       var listOfVisilbeNames = [String]();
//    
    func onPullToFresh(){
        print("refreshing now");
        

        listOfVisilbeNames = [String]();
        print("at first the list of Visible names is at...");
        print(listOfVisilbeNames.count);
        
        if(listOfVisilbeNames.count == 0){
            oneImageView.hidden = true;
            emptyImageView.hidden = false;
            self.view.makeToast("Grab a beacon and pull to refresh", duration: 1.5, position: CGPoint(x: self.view.bounds.size.width / 2.0, y: 560.0), style : style)
        }
        
//        else{

//        }

        //let error: NSErrorPointer = nil
        //let count = queryForTable().countObjects(error)
//        if(count - numberOfCellsPresent == 1){
//            self.view.makeToast("Awesome! Beacon was detected :)", duration: 1.5, position: CGPoint(x: self.view.bounds.size.width / 2.0, y: 560.0))
//            numberOfCellsPresent++
//        }
    }
    
    func beaconManager(manager: ESTBeaconManager!, didDiscoverBeacons beacons: [AnyObject]!, inRegion region: ESTBeaconRegion!) {
        //var gameScoreObject = PFObject(className:"ExampleData")
        //var query = PFQuery(className:"ExampleData")
        
//        print(query.valueForKey("major"))
        for beacon in beacons
        {
            //print(beacon.proximityUUID.UUIDString)
            
//            query.whereKey(String((beacon.major!)!), containedIn: gameScoreObject["major"] as! [AnyObject])
//            query.findObjectsInBackgroundWithBlock {
//                (objects: [AnyObject]?, error: NSError?) -> Void in
//                
//                if error == nil {
//                    print("NO ERROR");
////                    if (objects!.count > 0) {
////                        isPresent = true;
////                    }
//                    
//                } else {
//                    // Log details of the failure
//                    println("Error: \(error) \(error!.userInfo!)")
//                }
//                
////                completion(isUser: isPresent);
//            }

//            print(someInts.contains(minor));
//            if !someInts.contains(minor)
//            {
//                
////                someInts.append(minor)
//                
//                gameScoreObject["major"] = minor
//                //            gameScore["playerName"] = "Sean Plott"
//                //            gameScore["cheatMode"] = false
//                gameScoreObject.saveInBackgroundWithBlock {
//                    (success: Bool, error: NSError?) -> Void in
//                    if (success) {
//                        // The object has been saved.
//                    } else {
//                        // There was a problem, check error.description
//                    }
//                }
//
//            }
            
            
            
            
            
            
            
            print(String((beacon.major!)!));
            print(beacon.measuredPower);
        }
        
    }


    
    required init!(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Configure the PFQueryTableView
        self.parseClassName = "ExampleData"
        //self.textKey = "nameEnglish"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false

    }

    // Define the query that will provide the data for the table view
    override func queryForTable() -> PFQuery {
        let query = PFQuery(className: "ExampleData")
        query.orderByDescending("status")
        print("this is the list of beacons...")
        print(listOfBeaconNames.description)
        print(listOfBeaconNames.count)
        print("that was a list of beacons...")
        return query
    }
    
 
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell {
        

        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! PFTableViewCell!
        if cell == nil {
            cell = PFTableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        }

        
        let imageView_Background = UIImageView(frame: CGRectMake(10, 10, cell.frame.width + 30, cell.frame.height + 10))
        let image_Background = UIImage(named: "cellBackground.jpg")
        imageView_Background.image = image_Background
        cell.backgroundView = UIView()
        cell.backgroundView!.addSubview(imageView_Background)

        
        // Extract values from the PFObject to display in the table cell
        let minorID = object?["minor"]
        let majorID = object?["major"]
        cell?.textLabel?.text = "Beacon ID : " + String(minorID!) + "-" + String(majorID!)
        
        mainBeaconName = (cell?.textLabel?.text)!;

        
        if let mentorStatus = object?["status"] as? String {
            cell?.detailTextLabel?.text = mentorStatus
            cell?.detailTextLabel?.backgroundColor = UIColor.whiteColor();
            //if the beacon is active, display under which menetor the beacon is active
            if mentorStatus == "Active" {
                let currentBeaconName = object?["mainBeaconName"];
                print(currentBeaconName);
                print("OMFG I NEED THIS TO WORK!!!!!");
                cell?.textLabel?.text = String(currentBeaconName!);
            }
            else {
                print("let's see what's in the inactive");
                object?["mainBeaconName"] = "Beacon ID : " + String(minorID!) + "-" + String(majorID!)
                object!.saveInBackground()
            }
        }
        
        self.tableView.separatorStyle = .None
        
        if(!listOfVisilbeNames.contains(mainBeaconName)){
            listOfVisilbeNames.append(mainBeaconName);
        }
        
        print("but then the list of visible names becomes...");
        print(listOfVisilbeNames.description);
        print(listOfVisilbeNames.count);
        var count = listOfVisilbeNames.count;
        print("that was a list of visible names...");
        
        print("gna gna gna");
        
        if (count > 0) {
            emptyImageView.hidden = true;
            oneImageView.hidden = true;
            if( count == 1){
                oneImageView.hidden = false;
            }
        }
       
        
//        if(listOfVisilbeNames.count != listOfBeaconNames.count){
//            listOfBeaconNames = listOfVisilbeNames
//        }
//        
        //cell.backgroundColor = UIColor(hex: 0x55708d) //sets blue border of the cel
        return cell
    }

    
    override func viewDidAppear(animated: Bool) {
        //print("4");
//        var query = PFQuery(className:"ExampleData")
//        query.whereKey("objectId", equalTo:PFUser.currentUser()!.objectId)
        // Refresh the table to ensure any data changes are displayed
        //tableView.reloadData()
        //UIProgressView.appearance().progressTintColor = UIColor.whiteColor()
        
        self.tableView.separatorStyle = .None
        //print(numberOfSectionsInTableView(self.tableView))
        print("this is on appear");
        print(tableView.indexPathsForVisibleRows!.count)
        print("???this is on load");
        if(tableView.indexPathsForVisibleRows!.count > 0){
        //    emptyImageView.hidden = true;
        }
        else {
        //    emptyImageView.hidden = false;
        }
        print("BLEHHH");
 
        
    }
    
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("HEEEEYYY THIS IS HAPPENING!!!");
//        print(numberOfSectionsInTableView(tableView));
//            return 0;
//        
////        if self.numberOfRow == 0{
////            var emptyLabel = UILabel(frame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height))
////            emptyLabel.text = "No Data"
////            
////            self.tableView.backgroundView = emptyLabel
////            self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
////            return 0
////        } else {
////            return self.numberOfRow
////        }
//    }
    
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
    




    

    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath ) {
        
//        self.tableView.separatorStyle = .None
          //cell.backgroundColor = UIColor.whiteColor()
        
//        print("11WHAT IS THISSSS? HOW MANY ROWS DO WE HAVE ???");
        //        if (self.tableView.visibleCells.count) > 0 {
        //            emptyImageView.hidden = true;
        //        }
//        print(tableView.indexPathsForVisibleRows!.count)
//        if(tableView.indexPathsForVisibleRows!.count > 0){
//            emptyImageView.hidden = true;
//        }
        //print(tableView.indexPathForCell(<#T##cell: UITableViewCell##UITableViewCell#>)
        //(tableData[indexPath.row])
        //print(cell.isFirstResponder());
//        print(indexPath.length);
        //print(tableView.
//        emptyImageView.hidden = true;
//        print(cell.editing)
//        print(tableView.indexPathsForVisibleRows!.count)
//        do {
//            queryForTable().countObjects(error: )
//            print(messages);
//        } catch _ {
//            print("Error ocqurence when obtain other user list")
//        }
//        if( queryForTable().countObjects(NSError) == 0 ){
//        
//        }
//        let error: NSErrorPointer = nil
//        let count = queryForTable().countObjects(error)
//        print(count)
//
//        print(i++);
//        print("1111GOOOODDD !!!");
        cell.backgroundColor = UIColor(hex: 0x55708d) //sets blue border of the cel

    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //CODE TO BE RUN ON CELL TOUCH
//        let alertController = UIAlertController(title: "iOScreator", message:
//            "Hello, world!", preferredStyle: UIAlertControllerStyle.Alert)
//        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default,handler: nil))
        //self.tableView.separatorStyle = .None
        var userIsConnected = false;

        //select cell
        let cell = tableView.cellForRowAtIndexPath(tableView.indexPathForSelectedRow!)
        
        let mentorID = cell?.textLabel?.text!;
        let mentorStatus = cell?.detailTextLabel?.text;
        
        //Create alert pop-up
        let alertController = UIAlertController(title: mentorID , message: mentorStatus , preferredStyle: .Alert)
        
        //Add Cancel button
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }
        
        //Add Save button
        let saveAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            NSLog("Save Pressed")
    
            
            print("we are extracting the beacon id...");
            //var currentBeaconName = ((cell?.textLabel?.text!)!).stringByReplacingOccurrencesOfString("Beacon ID : ", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
            
            var currentBeaconName = ((cell?.textLabel?.text!)!)

            
            //var currentBeaconName = object["mainBeaconName"]
            //print("this is magic")
            
            print("this is initially the name of the beacon...");
            print(currentBeaconName)
            
            var messages = NSArray()
            var fuckingObjectID = "hey"
            
            let query = PFQuery(className: "ExampleData")
            query.whereKey("mainBeaconName", equalTo: currentBeaconName)
            do {
                messages = try query.findObjects()
            } catch _ {
                print("Error ocqurence when obtain other user list")
            }

            for message in messages {
                fuckingObjectID = message.objectId!! as String
            }
            var query2 = PFQuery(className:"ExampleData")
            query2.getObjectInBackgroundWithId(fuckingObjectID) {
                (object, error) -> Void in
                if error != nil {
                    print(error)
                } else {
                    if let object = object {
                        object["mainBeaconName"] = self.tField.text!
                    }
                    object!.saveInBackground()
                }
            }
            
            currentBeaconName = self.tField.text!
            cell?.textLabel?.text = currentBeaconName;
        }

        
        //Rename
        let renameAction = UIAlertAction(title: "Rename", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            NSLog("Rename Pressed")
            
            let alert = UIAlertController(title: cell?.textLabel?.text!, message: "is renamed to:", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addTextFieldWithConfigurationHandler(self.configurationTextField)
            
            alert.addAction(saveAction);
            alert.addAction(cancelAction);
            
            self.presentViewController(alert, animated: true, completion: {
                print("completion block")
            })
            
        }
        
        if (mentorStatus == "Active"){
            userIsConnected = true;
        }
        else if (mentorStatus == "Inactive") {
            userIsConnected = false;
        }
        
        
        if (userIsConnected){
            var disconnectAction = UIAlertAction(title: "Disconnect", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                NSLog("Disconnect Pressed")
                userIsConnected = false;
                
                //var currentBeaconName = ((cell?.textLabel?.text!)!)

                
                var messages = NSArray()
                var fuckingObjectID = "hey"
                
                var query = PFQuery(className: "ExampleData")
                query.whereKey("mainBeaconName", equalTo: mentorID!)
                do {
                    messages = try query.findObjects()
                    print(messages);
                } catch _ {
                    print("Error ocqurence when obtain other user list")
                }
                
                for message in messages {
                    //print(message.objectId!! as String)
                    fuckingObjectID = message.objectId!! as String
                }
                var query2 = PFQuery(className:"ExampleData")
                query2.getObjectInBackgroundWithId(fuckingObjectID) {
                    (object, error) -> Void in
                    if error != nil {
                        print(error)
                    } else {
                        if let object = object {
                            object["status"] = "Inactive"
                        }
                        object!.saveInBackground()
                    }
                }
                cell?.detailTextLabel?.text = "Inactive"
            }
            alertController.addAction(disconnectAction)
        }

        else {
            var connectAction = UIAlertAction(title: "Connect", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                NSLog("Connect Pressed")
                userIsConnected = true;

                var currentBeaconName = ((cell?.textLabel?.text!)!)
                
                var messages = NSArray()
                var fuckingObjectID = "hey"
                
                var query = PFQuery(className: "ExampleData")
                query.whereKey("mainBeaconName", equalTo: currentBeaconName)
                do {
                    messages = try query.findObjects()
                    print(messages);
                } catch _ {
                    print("Error ocqurence when obtain other user list")
                }
                
                for message in messages {
                    print(message.objectId!! as String)
                    fuckingObjectID = message.objectId!! as String
                }
                var query2 = PFQuery(className:"ExampleData")
                query2.getObjectInBackgroundWithId(fuckingObjectID) {
                    (object, error) -> Void in
                    if error != nil {
                        print(error)
                    } else {
                        if let object = object {
                            object["status"] = "Active"
                        }
                        object!.saveInBackground()
                    }
                }
                cell?.detailTextLabel?.text = "Active"
            }
            alertController.addAction(connectAction)
        }

        alertController.addAction(renameAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    
    
    

    
    func configurationTextField(textField: UITextField!)
    {
//        print("generating the TextField")
        textField.placeholder = "Enter person of interest name"
//        print("I WOULD LOVE TO BE HEALTHY");
//        print(textField.text!);
        self.tField = textField
    }
    
    //find objectID of given element
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
////                rowObject["capital"] = "yolooo"
//                rowObject.saveInBackground()
//            }
//        }
//    }
    
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
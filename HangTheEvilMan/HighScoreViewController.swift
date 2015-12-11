
import UIKit

class HightscoresTableViewController: UITableViewController {
    
    
    @IBOutlet var highScoreTable: UITableView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var score: UILabel!
    
    let highScoreDict = NSUserDefaults.standardUserDefaults()
    
    var scoreDict = [String:Int]()
    var keyArray = [NSObject]()
    var valueArray = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print (highScoreDict.dictionaryForKey("myDict")!)
        scoreDict = highScoreDict.dictionaryForKey("myDict") as! Dictionary<String, Int>
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return scoreDict.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("score cell", forIndexPath: indexPath)
        
        var temp: Array<String> = Array(scoreDict.keys)
        var temp2: Array<Int> = Array(scoreDict.values)
        
        cell.textLabel!.text =
        cell.detailTextLabel!.text = String(temp2[indexPath.row])
        
        return cell
    }
}

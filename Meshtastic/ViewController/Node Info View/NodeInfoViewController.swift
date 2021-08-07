//
//  NodeInfoViewController.swift
//  Meshtastic
//
//  Created by Joshua Pirihi on 7/08/21.
//

import UIKit

class NodeInfoViewController: UIViewController {

    var nodeInfo: NodeInfo?
    
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var nodeNumberLabel: UILabel?
    @IBOutlet var longNameLabel: UILabel?
    @IBOutlet var shortNameLabel: UILabel?
    @IBOutlet var macAddrLabel: UILabel?
    @IBOutlet var hwModelLabel: UILabel?
    @IBOutlet var latitudeLabel: UILabel?
    @IBOutlet var longitudeLabel: UILabel?
    @IBOutlet var altitudeLabel: UILabel?
    @IBOutlet var snrLabel: UILabel?
    @IBOutlet var lastHeardLabel: UILabel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if nodeInfo != nil {
            self.titleLabel?.text = self.nodeInfo!.user.longName
            self.nodeNumberLabel?.text = String(self.nodeInfo!.num)
            self.longNameLabel?.text = self.nodeInfo!.user.longName
            self.shortNameLabel?.text = self.nodeInfo!.user.shortName
            self.macAddrLabel?.text =  self.nodeInfo!.user.macaddr.hexDescription
            self.hwModelLabel?.text = String(reflecting: self.nodeInfo!.user.hwModel)
            self.latitudeLabel?.text = String(Double(self.nodeInfo!.position.latitudeI)*1e-7)
            self.longitudeLabel?.text = String(Double(self.nodeInfo!.position.longitudeI)*1e-7)
            self.altitudeLabel?.text = String(self.nodeInfo!.position.altitude)
            self.snrLabel?.text = String(self.nodeInfo!.snr)
            let df = DateFormatter()
            df.dateStyle = .short
            df.timeStyle = .medium
            self.lastHeardLabel?.text = df.string(from: Date(timeIntervalSince1970: TimeInterval(self.nodeInfo!.lastHeard)))
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

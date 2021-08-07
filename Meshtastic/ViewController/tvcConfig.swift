//
//  tvcConfig.swift
//  Meshtastic
//
//  Created by Thomas Huttinger on 04.10.20.
//

import UIKit

class tvcConfig: UITableViewController
{
    //---------------------------------------------------------------------------------------
    // MARK: - IBOutlets
    //---------------------------------------------------------------------------------------

    //---------------------------------------------------------------------------------------

    
    //---------------------------------------------------------------------------------------
    // MARK: - IBActions
    //---------------------------------------------------------------------------------------

    @IBAction func unwindToPresentingViewController(segue:UIStoryboardSegue)
    {
        if segue.identifier == "SegueUnwindConfigDetail"
        {
            if let vcEdit = segue.source as? vcEditText
            {
                let dataFieldName = vcEdit.CellData.dataFieldName
                let value = vcEdit.CellData.value
                
                MasterViewController.shared.radioConfigValueUpdated(dataFieldName: dataFieldName, value: value, currentRaidioConfig: self.radioConfig)
            }
        }

        if segue.identifier == "SegueUnwindLoRsModulationConfig"
        {
            if let vcEdit = segue.source as? vcLoRaModulationConfig
            {
                let bandwidth = vcEdit.CellData.bandWidth
                let spreadingFactor = vcEdit.CellData.spreadingFactor
                let codingRate = vcEdit.CellData.codingRate
                
                MasterViewController.shared.radioConfigLoRaModulationUpdated(bandwidth: bandwidth, spreadingFactor: spreadingFactor, codingRate: codingRate, currentRadioConfig: self.radioConfig)
            }
        }
    }

    //---------------------------------------------------------------------------------------
    
    
    //---------------------------------------------------------------------------------------
    // MARK: - private class variables
    //---------------------------------------------------------------------------------------

    private var sectionDefinitions: [(numberOfRowsAtSection: Int, text: String)] = [
        (15, "RADIO - PREFERENCES"),
        (8, "RADIO - CHANNEL SETTINGS")]

    private struct cellData
    {
        var caption = ""
        var value = ""
        var info = ""
    }
    
    private var currentCell: cellEditText!

    //---------------------------------------------------------------------------------------

    
    //---------------------------------------------------------------------------------------
    // MARK: - public class variables
    //---------------------------------------------------------------------------------------

    public var radioConfig: RadioConfig = RadioConfig()
    public var channelSettings: ChannelSettings = ChannelSettings()
    public var needsReload: Bool = false

    //---------------------------------------------------------------------------------------


    //---------------------------------------------------------------------------------------
    // MARK: - private functions
    //---------------------------------------------------------------------------------------

    private func registerCell()
    {
        let cell = UINib(nibName: "cellEditText", bundle: nil)
        self.tableView.register(cell, forCellReuseIdentifier: "cellConfigText")
    }

    
    private func initCellsFor_RadioPreferences(indexPath: IndexPath) -> UITableViewCell
    {
        switch indexPath.row
        {
            case 0:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellConfigText", for: indexPath) as! cellEditText
                cell.lblCaption.text = "Position Broadcast Secs"
                cell.lblValue.text = String(self.radioConfig.preferences.positionBroadcastSecs)
                cell.lblInfo.text = "We should send our position this often (but only if it has changed significantly)"
                cell.datafieldName = "preferences.positionBroadcastSecs"
                return cell

            case 1:

                let cell = tableView.dequeueReusableCell(withIdentifier: "cellConfigText", for: indexPath) as! cellEditText
                cell.lblCaption.text = "Send Owner Interval"
                cell.lblValue.text = String(self.radioConfig.preferences.sendOwnerInterval)
                cell.lblInfo.text = "Send our owner info at least this often (also we always send once at boot to rejoin the mesh)"
                cell.datafieldName = "preferences.sendOwnerInterval"
                return cell

            case 2:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellConfigText", for: indexPath) as! cellEditText
                cell.lblCaption.text = "Num Missed To Fail"
                //cell.lblValue.text = String(self.radioConfig.preferences.numMissedToFail)
                cell.lblInfo.text = "If we miss this many owner messages from a node, we declare the node offline (defaults to 3 - to allow for some lost packets)"
                cell.datafieldName = "preferences.numMissedToFail"
                return cell

            case 3:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellConfigText", for: indexPath) as! cellEditText
                cell.lblCaption.text = "Wait Bluetooth Secs"
                cell.lblValue.text = String(self.radioConfig.preferences.waitBluetoothSecs)
                cell.lblInfo.text = ""
                cell.datafieldName = "preferences.waitBluetoothSecs"
                return cell

            case 4:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellConfigText", for: indexPath) as! cellEditText
                cell.lblCaption.text = "Screen On Secs"
                cell.lblValue.text = String(self.radioConfig.preferences.screenOnSecs)
                cell.lblInfo.text = ""
                cell.datafieldName = "preferences.screenOnSecs"
                return cell

            case 5:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellConfigText", for: indexPath) as! cellEditText
                cell.lblCaption.text = "Phone Timeout Secs"
                cell.lblValue.text = String(self.radioConfig.preferences.phoneTimeoutSecs)
                cell.lblInfo.text = ""
                cell.datafieldName = "preferences.phoneTimeoutSecs"
                return cell

            case 6:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellConfigText", for: indexPath) as! cellEditText
                cell.lblCaption.text = "Phone Sds Timeout Sec"
                cell.lblValue.text = String(self.radioConfig.preferences.phoneSdsTimeoutSec)
                cell.lblInfo.text = ""
                cell.datafieldName = "preferences.phoneSdsTimeoutSec"
                return cell

            case 7:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellConfigText", for: indexPath) as! cellEditText
                cell.lblCaption.text = "Mesh Sds Timeout Secs"
                cell.lblValue.text = String(self.radioConfig.preferences.meshSdsTimeoutSecs)
                cell.lblInfo.text = ""
                cell.datafieldName = "preferences.meshSdsTimeoutSecs"
                return cell

            case 8:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellConfigText", for: indexPath) as! cellEditText
                cell.lblCaption.text = "Sds Secs"
                cell.lblValue.text = String(self.radioConfig.preferences.sdsSecs)
                cell.lblInfo.text = ""
                cell.datafieldName = "preferences.sdsSecs"
                return cell

            case 9:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellConfigText", for: indexPath) as! cellEditText
                cell.lblCaption.text = "Ls Secs"
                cell.lblValue.text = String(self.radioConfig.preferences.lsSecs)
                cell.lblInfo.text = ""
                cell.datafieldName = "preferences.lsSecs"
                return cell

            case 10:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellConfigText", for: indexPath) as! cellEditText
                cell.lblCaption.text = "Min Wake Secs"
                cell.lblValue.text = String(self.radioConfig.preferences.minWakeSecs)
                cell.lblInfo.text = ""
                cell.datafieldName = "preferences.minWakeSecs"
                return cell

            case 11:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellConfigText", for: indexPath) as! cellEditText
                cell.lblCaption.text = "Wifi Ssid"
                cell.lblValue.text = String(self.radioConfig.preferences.wifiSsid)
                cell.lblInfo.text = "If set, this node will try to join the specified wifi network and acquire an address via DHCP"
                cell.datafieldName = "preferences.wifiSsid"
                return cell

            case 12:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellConfigText", for: indexPath) as! cellEditText
                cell.lblCaption.text = "Wifi Password"
                cell.lblValue.text = String(self.radioConfig.preferences.wifiPassword)
                cell.lblInfo.text = "If set, will be use to authenticate to the named wifi"
                cell.datafieldName = "preferences.wifiPassword"
                return cell

            case 13:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellConfigText", for: indexPath) as! cellEditText
                cell.lblCaption.text = "Wifi Ap Mode"
                cell.lblValue.text = String(self.radioConfig.preferences.wifiApMode)
                cell.lblInfo.text = "If set, the node will operate as an AP (and DHCP server), otherwise it will be a station"
                cell.datafieldName = "preferences.wifiApMode"
                return cell

            case 14:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellConfigText", for: indexPath) as! cellEditText
                cell.lblCaption.text = "Ignore Incoming"
                cell.lblValue.text = self.radioConfig.preferences.ignoreIncoming.description
                cell.lblInfo.text = "For testing it is useful sometimes to force a node to never listen to particular other nodes (simulating radio out of range). All nodenums listed in ignore_incoming will have packets they send droped on receive (by router.cpp)"
                cell.datafieldName = "preferences.ignoreIncoming"
                return cell
                                
            default:
                return UITableViewCell()
        }
    }
    
    
    private func initCellsFor_RadioChannelSettings(indexPath: IndexPath) -> UITableViewCell
    {
        switch indexPath.row
        {
            case 0:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellConfigText", for: indexPath) as! cellEditText
                cell.lblCaption.text = "Tx Power (dBm)"
                cell.lblValue.text = String(self.channelSettings.txPower)
                cell.lblInfo.text = "If zero then, use default max legal continuous power (ie. something that won't burn out the radio hardware). In most cases you should use zero here."
                cell.datafieldName = "channelSettings.txPower"
                return cell

            case 1:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellConfigText", for: indexPath) as! cellEditText
                cell.lblCaption.text = "Modem Config"
                cell.lblValue.text = String(self.channelSettings.modemConfig.rawValue)
                cell.lblInfo.text = "Note: This is the 'old' mechanism for specifying channel parameters. Either modem_config or bandwidth/spreading/coding will be specified - NOT BOTH. As a heuristic: If bandwidth is specified, do not use modem_config. Because protobufs take ZERO space when the value is zero this works out nicely.\n\nbw125Cr45Sf128  (medium range)\n\nbw500Cr45Sf128  (Fast+short range)\n\nbw31_25Cr48Sf512  (Slow+long range)\n\nbw125Cr48Sf4096  (Slow+long range)"
                cell.datafieldName = "channelSettings.modemConfig"
                return cell

            case 2:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellConfigText", for: indexPath) as! cellEditText
                cell.lblCaption.text = "Bandwidth"
                cell.lblValue.text = String(self.channelSettings.bandwidth)
                cell.lblInfo.text = "Bandwidth in MHz Certain bandwidth numbers are 'special' and will be converted to the appropriate floating point value: 31 -> 31.25MHz"
                cell.datafieldName = "channelSettings.bandwidth"
                return cell

            case 3:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellConfigText", for: indexPath) as! cellEditText
                cell.lblCaption.text = "Spread Factor"
                cell.lblValue.text = String(self.channelSettings.spreadFactor)
                cell.lblInfo.text = "A number from 7 to 12. Indicates number of chirps per symbol as 1<<spread_factor."
                cell.datafieldName = "channelSettings.spreadFactor"
                return cell

            case 4:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellConfigText", for: indexPath) as! cellEditText
                cell.lblCaption.text = "Coding Rate"
                cell.lblValue.text = String(self.channelSettings.codingRate)
                cell.lblInfo.text = "The denominator of the coding rate. Ie for 4/8, the value is 8. 4/5 the value is 5."
                cell.datafieldName = "channelSettings.codingRate"
                return cell

            case 5:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellConfigText", for: indexPath) as! cellEditText
                cell.lblCaption.text = "Channel Num"
                cell.lblValue.text = String(self.channelSettings.channelNum)
                cell.lblInfo.text = "A channel number within EU433 band (433.050 to 434.790 MHz)\n\n1 = 433.175 MHz\n2 = 433.375 MHz\n3 = 433.575 MHz\n4 = 433.775 MHz\n5 = 433.975 MHz\n6 = 434.175 MHz\n7 = 434.375 MHz"
                cell.datafieldName = "channelSettings.channelNum"
                return cell

            case 6:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellConfigText", for: indexPath) as! cellEditText
                cell.lblCaption.text = "PSK"
                cell.lblValue.text = self.channelSettings.psk.hexDescription
                //cell.lblValue.text = String(decoding: self.radioConfig.channelSettings.psk, as: UTF8.self)
                cell.lblInfo.text = "A simple preshared key for now for crypto.  Must be either 0 bytes (no crypto), 16 bytes (AES128), or 32 bytes (AES256)"
                cell.datafieldName = "channelSettings.psk"
                return cell

            case 7:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellConfigText", for: indexPath) as! cellEditText
                cell.lblCaption.text = "Name"
                cell.lblValue.text = self.channelSettings.name
                cell.lblInfo.text = "A SHORT name that will be packed into the URL.  Less than 12 bytes. Something for end users to call the channel"
                cell.datafieldName = "channelSettings.name"
                return cell

                                
            default:
                return UITableViewCell()
        }
    }

    //---------------------------------------------------------------------------------------


    //---------------------------------------------------------------------------------------
    // MARK: - public functions
    //---------------------------------------------------------------------------------------

    //---------------------------------------------------------------------------------------
    
    
    //=======================================================================================
    // MARK: - TableView delegates
    //=======================================================================================
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        registerCell()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationController?.visibleViewController?.title = "Device Settings"
        
        if (self.needsReload)
        {
            self.tableView.reloadData()
            self.needsReload = false
        }
    }


    //---------------------------------------------------------------------------------------
    // Table datasource
    //---------------------------------------------------------------------------------------

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return sectionDefinitions.count
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var rows: Int = 0

        if section < sectionDefinitions.count
        {
            rows = sectionDefinitions[section].0
        }

        return rows
    }

    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {

        var sectionName: String = ""
        
        if section < sectionDefinitions.count
        {
            sectionName = sectionDefinitions[section].1
        }
        
        return sectionName
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let section = indexPath.section
        switch section
        {
            case 0:
                let cell = initCellsFor_RadioPreferences(indexPath: indexPath)
                return cell
    
            case 1:
                let cell = initCellsFor_RadioChannelSettings(indexPath: indexPath)
                return cell

            default:
                return UITableViewCell()
    
        }
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {
        view.tintColor = UIColor.systemGroupedBackground

        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.secondaryLabel
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 12)

        header.textLabel?.addConstraint(NSLayoutConstraint(item: header.textLabel!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40))
        header.textLabel?.addConstraint(NSLayoutConstraint(item: header.textLabel!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200))
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 40.0
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.currentCell = tableView.cellForRow(at: indexPath) as? cellEditText

        switch self.currentCell.lblCaption.text
        {
            case "Bandwidth",
                 "Spread Factor",
                 "Coding Rate":
                self.performSegue(withIdentifier: "SegueShowLoRaModulationConfig", sender: self)

            default:
                self.performSegue(withIdentifier: "SegueShowConfigDetail", sender: self)
        }
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
    //---------------------------------------------------------------------------------------

    
    //---------------------------------------------------------------------------------------
    // Navigation
    //---------------------------------------------------------------------------------------
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?)
     {
         if(segue.identifier == "SegueShowConfigDetail")
         {
             let vcEdit = segue.destination as! vcEditText
             vcEdit.CellData.caption = self.currentCell.lblCaption.text!
             vcEdit.CellData.value = self.currentCell.lblValue.text!
             vcEdit.CellData.info = self.currentCell.lblInfo.text!
             vcEdit.CellData.dataFieldName = self.currentCell.datafieldName
         }
         
         if(segue.identifier == "SegueShowLoRaModulationConfig")
         {
             let vcEdit = segue.destination as! vcLoRaModulationConfig
             vcEdit.CellData.bandWidth = String(self.channelSettings.bandwidth)
             vcEdit.CellData.spreadingFactor = String(self.channelSettings.spreadFactor)
             vcEdit.CellData.codingRate = String(self.channelSettings.codingRate)
         }

     }

    //---------------------------------------------------------------------------------------


}

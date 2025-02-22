//
//  MyNodeInfo_DP.swift
//  Meshtastic
//
//  Created by Thomas Huttinger on 19.12.20.
//

import Foundation

class MyNodeInfo_DP
{
    //---------------------------------------------------------------------------------------
    // MARK: - private class variables
    //---------------------------------------------------------------------------------------
    
    //---------------------------------------------------------------------------------------

        
    //---------------------------------------------------------------------------------------
    // MARK: - public class variables
    //---------------------------------------------------------------------------------------
    
    //---------------------------------------------------------------------------------------

    
    // MARK: - Initialization
    public init()
    {
        
        
    }
    
    
    //---------------------------------------------------------------------------------------
    // MARK: - private functions
    //---------------------------------------------------------------------------------------

    //---------------------------------------------------------------------------------------

    
    //---------------------------------------------------------------------------------------
    // MARK: - public functions
    //---------------------------------------------------------------------------------------

    /// Writes a myNodeInfo object into database
    ///
    /// - Parameters:
    ///     - myNodeInfo: The myNodeInfo data object
    ///
    public func dbWrite(_ myNodeInfo: MyNodeInfo)
    {
        DataBase.shared.myNodeInfo_DO = myNodeInfo
    }
    
    
    /// Reads a myNodeInfo object from DB.
    ///
    /// - Returns: The myNodeInfo object
    ///
    public func dbRead() -> MyNodeInfo?
    {
        return DataBase.shared.myNodeInfo_DO
    }


    //---------------------------------------------------------------------------------------

    
}

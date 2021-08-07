//
//  NodeInfo_DP.swift
//  Meshtastic
//
//  Created by Thomas Huttinger on 13.12.20.
//

import Foundation


/// NodeInfo data processor
///
class NodeInfo_DP
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
    
    /// Get the index of a node within array
    ///
    /// - Parameters:
    ///     - nodeInfo: The node data object for which we want to get the index
    ///
    /// - Returns: The index of the node object within it's array
    ///
    private func getNodeIdx(_ nodeId: UInt32) -> Int
    {
        var iCounter = 0
        for element in DataBase.shared.nodeArray
        {
            if (element.num == nodeId)
            {
                return iCounter
            }
            iCounter += 1
        }
        return -1
    }

    //---------------------------------------------------------------------------------------
        
    
    
    //---------------------------------------------------------------------------------------
    // MARK: - public functions
    //---------------------------------------------------------------------------------------
    
    /// Writes a node object into database
    /// If the object allready exists in db it will be updated
    ///
    /// - Parameters:
    ///     - nodeInfo: The node data object
    ///
    public func dbWrite(_ nodeInfo: NodeInfo)
    {
        let index = getNodeIdx(nodeInfo.num)
        if (index > -1) //Update
        {
            DataBase.shared.nodeArray[index] = nodeInfo
        }
        else //Add
        {
            DataBase.shared.nodeArray += [nodeInfo]
        }
    }
    
    /// Updates a person object within it's node structure.
    /// If the appropriate node object doesn't allready exist in database, we create it
    ///
    /// - Parameters:
    ///     - user: The user data object
    ///     - nodeId: Id of the enclosing node object
    ///
    public func dbWrite(_ user: User, nodeId: UInt32)
    {
        let index = getNodeIdx(nodeId)
        if (index > -1) //Update
        {
            DataBase.shared.nodeArray[index].user = user
            //DataBase.shared.nodeArray[index].hasUser = true
        }
        else //Add
        {
            var nodeInfo = NodeInfo()
            nodeInfo.num = nodeId
            nodeInfo.user = user
            //nodeInfo.hasUser = true
            DataBase.shared.nodeArray += [nodeInfo]
        }
    }

    
    /// Updates a position object within it's node structure.
    /// If the appropriate node object doesn't allready exist in database, we create it
    ///
    /// - Parameters:
    ///     - position: The position data object
    ///     - nodeId: Id of the enclosing node object
    ///
    public func dbWrite(_ position: Position, nodeId: UInt32)
    {
        let index = getNodeIdx(nodeId)
        if (index > -1) //Update
        {
            DataBase.shared.nodeArray[index].position = position
            //DataBase.shared.nodeArray[index].hasPosition = true
        }
        else //Add
        {
            var nodeInfo = NodeInfo()
            nodeInfo.num = nodeId
            nodeInfo.position = position
            //nodeInfo.hasPosition = true
            DataBase.shared.nodeArray += [nodeInfo]
        }        
    }
    
    
    /// Reads a node object from DB.
    ///
    /// - Parameters:
    ///     - nodeId: Id of the node object to read
    ///
    /// - Returns: The node object or nil if it was not found
    ///
    public func dbRead( nodeId: UInt32) -> NodeInfo?
    {
        // Check if node is already in the array.
        for element in DataBase.shared.nodeArray
        {
            if (element.num == nodeId)
            {
                return element
            }
        }
        return nil
    }

    
    /// Get your own node object
    ///
    /// - Returns: A node object or nil if it was not found
    ///
    public func getMyNodeObject() -> NodeInfo?
    {
        let myNodeNumber = DataBase.shared.myNodeInfo_DO.myNodeNum
        let myNodeObject = dbRead(nodeId: myNodeNumber)
        return myNodeObject ?? nil
    }
    
 
    /// Get the Node Id assigned to the passed user Id
    ///
    /// - Parameters:
    ///     - userId: Id of the user for whom we want to get the NodeId
    ///
    /// - Returns: The NodeId we are looking for
    ///
    public func getNodeIdByUserId(userId: String) -> UInt32
    {
        for element in DataBase.shared.nodeArray
        {
            if (element.user.id == userId)
            {
                return element.num
            }
        }
        return 0
    }
    
    
    
    
    //---------------------------------------------------------------------------------------

    
}

//
//  CalculateBitDifference.swift
//  BitManipulation
//
//  Created by Preet on 2019-04-15.
//  Copyright © 2019 Preetinder Marok. All rights reserved.
//

import Foundation

struct Calculate {
    func bitSwapCount(x: Int, y: Int) -> Int {
        
        // Find different bits
        let signedDifferentBits = x ^ y
        
        // Bitcast Int to UInt to allow the algorithm work correctly also for negative numbers.
        var differentBits: UInt = UInt(bitPattern: signedDifferentBits)
        
        // Count the bits
        var count = 0
        
        // Until there are some bits set to '1' in differentBits.
        while differentBits > 0 {
            // Mask differentBits with number 1 aka 00000001.
            // By doing this, we set all bits of differentBits
            // but the last one to zero.
            let maskedBits = differentBits & 1
            
            // If the last bit is not zero,
            if maskedBits != 0 {
                // increment the counter.
                count += 1
            }
            
            // Shift bits in differentBits to the right.
            differentBits = differentBits >> 1
        }
        
        // return the number of 1s we've found.
        return count
    }

}

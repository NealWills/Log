//
//  File.swift
//  
//
//  Created by Neal on 2019/11/3.
//

import Foundation

public enum Level {
    case Trace, Debug, Info, Warning, Error
}

public enum Open{
    case Open, Close
}

struct logMark {
    
    var markTrace = ""
    
    var markDebug = ""
    
    var markInfo = ""
    
    var markWarning = ""
    
    var markError = ""
    
    init(markTrace: String?=nil, markDebug: String?=nil, markInfo: String?=nil, markWarning: String?=nil, markError: String?=nil) {
        
        if markTrace != nil {
            self.markTrace = markTrace!
        }
        
        if markDebug != nil {
            self.markDebug = markDebug!
        }
        
        if markInfo != nil {
            self.markInfo = markInfo!
        }
        
        if markWarning != nil {
            self.markWarning = markWarning!
        }
        
        if markError != nil {
            self.markError = markError!
        }
    
    }

}

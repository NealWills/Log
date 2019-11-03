import Foundation

struct LogManager {

    static var isLogOpen = false
    
    static public func setLoggerState(_ open: Open) {
        if open == .Open {
            isLogOpen = true
        } else {
            isLogOpen = false
        }
    }
    
    static func Log(_ items: Any..., level: Level?=nil, fileName: String = #file, line: Int = #line) {
        var levelL: Level!
        if level != nil {
            levelL = level
        } else {
            levelL = .Info
        }
        
         LogManager(levelL, items, fileName: fileName, line: line)
    }
    
//    static public func trace(_ items: Any..., fileName: String = #file, line: Int = #line) {
//        LogManager(.Trace, items, fileName: fileName, line: line)
//    }
//
//    static public func Debug(_ items: Any..., fileName: String = #file, line: Int = #line) {
//        LogManager(.Debug, items, fileName: fileName, line: line)
//    }
//
//    static public func Info(_ items: Any..., fileName: String = #file, line: Int = #line) {
//        LogManager(.Info, items, fileName: fileName, line: line)
//    }
//
//    static public func Warning(_ items: Any..., fileName: String = #file, line: Int = #line) {
//        LogManager(.Warning, items, fileName: fileName, line: line)
//    }
//
//    static public func Error(_ items: Any..., fileName: String = #file, line: Int = #line) {
//        LogManager(.Error, items, fileName: fileName, line: line)
//    }
    
    static fileprivate func LogManager(_ level: Level, _ items: [Any], fileName: String = #file, line: Int = #line) {
        
        if !self.isLogOpen {
            return
        }
        
        //获取时间
        let date = NSDate()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss.SSS"
        let strNowTime = timeFormatter.string(from: date as Date) as String
        
        //获取文件名
        var arrFileName = fileName.components(separatedBy: "/")
        arrFileName = (arrFileName.last?.components(separatedBy: "."))!
        
        print("")
        print("╔ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═")
        print("  \(strNowTime)", "[\(level)]", "[" + (arrFileName.first ?? "File") + ": \(line)]")
        for item in items {
            print("  \(item)")
        }
        print("╚ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═ ═")
    }
}

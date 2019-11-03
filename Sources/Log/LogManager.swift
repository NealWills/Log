import Foundation

struct LogManager {

    static var isLogOpen = false
    
    static var mark = logMark.init()
    
    
    
    /// 核心
    static fileprivate func LogManager(_ level: String, _ items: Any..., fileName: String = #file, line: Int = #line) {
        
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

//MARK:- 设置开启日志
extension LogManager {
    static func setLoggerState(_ open: Open) {
        if open == .Open {
            isLogOpen = true
        } else {
            isLogOpen = false
        }
    }
}

//MARK:- 设置标志
extension LogManager {
    static func setMark(markTrace: String?=nil, markDebug: String?=nil, markInfo: String?=nil, markWarning: String?=nil, markError: String?=nil) {
        self.mark = logMark.init(markTrace: markTrace, markDebug: markDebug, markInfo: markInfo, markWarning: markWarning, markError: markError)
    }
}

//MARK:- 打印模式
extension LogManager {
    static func Trace(_ items: Any..., fileName: String = #file, line: Int = #line) {
        LogManager(mark.markTrace + "\(Level.Trace)" + mark.markTrace, items, fileName: fileName, line: line)
    }

    static func Debug(_ items: Any..., fileName: String = #file, line: Int = #line) {
        LogManager(mark.markDebug + "\(Level.Debug)" + mark.markDebug, items, fileName: fileName, line: line)
    }

    static func Info(_ items: Any..., fileName: String = #file, line: Int = #line) {
        LogManager(mark.markInfo + "\(Level.Info)" + mark.markInfo, items, fileName: fileName, line: line)
    }

    static func Warning(_ items: Any..., fileName: String = #file, line: Int = #line) {
        LogManager(mark.markWarning + "\(Level.Warning)" + mark.markWarning, items, fileName: fileName, line: line)
    }

    static func Error(_ items: Any..., fileName: String = #file, line: Int = #line) {
        LogManager(mark.markError + "\(Level.Error)" + mark.markError, items, fileName: fileName, line: line)
    }
}

//MARK:- 普通打印
extension LogManager {
    static func Log(_ items: Any..., level: Level?=nil, fileName: String = #file, line: Int = #line) {
        var levelL: Level!
        if level != nil {
            levelL = level
        } else {
            levelL = .Info
        }
        
        LogManager("\(levelL ?? .Info)", items, fileName: fileName, line: line)
    }
}



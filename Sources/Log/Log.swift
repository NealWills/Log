
public func setLoggerState(_ open: Open) {
    LogManager.setLoggerState(open)
}

public func setMark(markTrace: String?=nil, markDebug: String?=nil, markInfo: String?=nil, markWarning: String?=nil, markError: String?=nil) {
    LogManager.setMark(markTrace: markTrace, markDebug: markDebug, markInfo: markInfo, markWarning: markWarning, markError: markError)
}

public func Log(_ items: Any..., level: Level?=nil, fileName: String = #file, line: Int = #line) {
    LogManager.Log(items, level: level, fileName: fileName, line: line)
}

public func Trace(_ items: Any..., fileName: String = #file, line: Int = #line) {
    LogManager.Trace(items, fileName: fileName, line: line)
}

public func Debug(_ items: Any..., fileName: String = #file, line: Int = #line) {
    LogManager.Debug(items, fileName: fileName, line: line)
}

public func Info(_ items: Any..., fileName: String = #file, line: Int = #line) {
    LogManager.Info(items, fileName: fileName, line: line)
}

public func Warning(_ items: Any..., fileName: String = #file, line: Int = #line) {
    LogManager.Warning(items, fileName: fileName, line: line)
}

public func Error(_ items: Any..., fileName: String = #file, line: Int = #line) {
    LogManager.Error(items, fileName: fileName, line: line)
}


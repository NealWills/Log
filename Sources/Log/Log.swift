
public func setLoggerState(_ open: Open) {
    LogManager.setLoggerState(open)
}

public func Log(_ items: Any..., level: Level?=nil, fileName: String = #file, line: Int = #line) {
    LogManager.Log(items, level: level, fileName: fileName, line: line)
}


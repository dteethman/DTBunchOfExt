public extension Int {
    public func getNoun(_ root: String, singleEnd: String, dualEnd: String, multipleEnd: String) -> String {
        var resStr = ""
        switch self % 10 {
        case 1:
            resStr = root + singleEnd
        case 2, 3, 4:
            resStr = root + dualEnd
        default:
            resStr = root + multipleEnd
        }
        
        switch self % 100 {
        case 11, 12, 13, 14:
            resStr = root + multipleEnd
        default:
            break
        }
        
        return resStr
    }
}

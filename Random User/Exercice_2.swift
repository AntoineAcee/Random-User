func cleanHobbits(arr: Array<String>) -> (String, String, Array<String>, Int) {
    
    var narr:[String] = []
    
    for item in arr {
        
        if (item != arr.first && item != arr.last) {
            narr.insert(item, at: 0)
        }
        
    }
    
    return (arr.first!, arr.last!, narr, narr.count)
    
}
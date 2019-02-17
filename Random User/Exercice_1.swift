func condog(str: String, prefix: Character, suffix: String) -> String {
    var str2 = str
    str2.insert(prefix, at: str2.startIndex)
    str2.append(suffix)
    return str2
}
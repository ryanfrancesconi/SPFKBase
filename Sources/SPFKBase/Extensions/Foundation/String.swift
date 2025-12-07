// Copyright Ryan Francesconi. All Rights Reserved. Revision History at https://github.com/ryanfrancesconi/spfk-utils

import AudioToolbox

extension String {
    public static let nbsp: String = "\u{00A0}"
}

// MARK: - Character Filters

extension String {
    public var titleCased: String {
        return self
            .replacingOccurrences(
                of: "([A-Z])",
                with: " $1",
                options: .regularExpression,
                range: range(of: self)
            )
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .capitalized // If input is in llamaCase
    }
}

// MARK: - Comparison

extension String {
    // because I keep forgetting this syntax
    public func equalsIgnoringCase(_ string: String) -> Bool {
        caseInsensitiveCompare(string) == .orderedSame
    }

    public func standardCompare(with otherString: String, ascending: Bool = true) -> Bool {
        let comparisonResult = localizedStandardCompare(otherString)

        return ascending ?
            comparisonResult == .orderedAscending :
            comparisonResult == .orderedDescending
    }
}

// MARK: - Delimited Strings

extension StringProtocol {
    /// Splits a delimited string into elements.
    ///
    /// - Optionally, you can allow duplicates or allow empty elements.
    /// - Omits elements starting with a null character.
    public func splitDelimited(delimiter: String = ",",
                               allowDuplicates: Bool = false,
                               allowEmptyElements: Bool = false) -> [String] {
        let keywordArray = components(separatedBy: delimiter)
        var out: [String] = []

        for item in keywordArray {
            let word: String = item.trimmed

            guard word.first != "\0",
                  !word.isEmpty || allowEmptyElements,
                  !out.contains(word) || allowDuplicates else { continue }

            out.append(word.trimmed)
        }
        return out
    }
}

extension StringProtocol {
    /// Convenience function to return a new string with whitespaces and newlines trimmed off start and end.
    public var trimmed: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension StringProtocol {
    /// Convenience conversion
    public var auValue: AUValue? {
        AUValue(self)
    }

    // useful for xml parsing
    public var boolValue: Bool {
        lowercased() == "true" || self == "1"
    }
}

extension String {
    public var urlEncoded: String? {
        addingPercentEncoding(withAllowedCharacters: .urlAllowed)
    }

    public var urlQueryEncoded: String? {
        urlEncoded?.replacingOccurrences(of: "%20", with: "+")
    }
}

extension CharacterSet {
    public static let urlAllowed: CharacterSet = {
        .alphanumerics.union(
            .init(charactersIn: "-._~")
        ) // as per RFC 3986
    }()
}

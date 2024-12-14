// take keyword args
params.data = "data/5.in"

// workflow {
//     // Split on blank newline
//     // ^\n won't work with .text as it isn't the beginning but only in readLines which is not what we want here
//     def (rules, pages) = file(params.data)
//             .text
//             .split(/\n\n/)

//     // Split rules into pairs 1|2 -> [[1, 2]]
//     rules = rules
//         .readLines()
//         .collect {
//             it.split(/\|/, 2).collect { it as Long  }
//         }

//     // Split pages into arrays 1,2,3 [[1,2,3]]
//     pages = pages.readLines()
//         .collect { it.split(",").collect { it as Long  } }

//     // Pileup all pages and check if reverse is never true
//     def result = pages.collect { page ->
//         // Correct reversed pairs in the page
//         (0..<page.size()).each { idx ->
//             ((idx + 1)..<page.size()).each { e ->
//                 if ([page[e], page[idx]] in rules) {
//                     // Swap back to the correct order
//                     def temp = page[idx]
//                     page[idx] = page[e]
//                     page[e] = temp
//                 }
//             }
//         }
//         // Return the middle number after correction
//         page[(page.size() - 1) / 2]
//     }


//     // def result = pages.collect { page ->
//     //     def middleIndex = (page.size() - 1) / 2      // Find middle index
//     //     def middle = page[middleIndex]              // Middle element

//     //     // Check all pairs (middle, element) to see if any reversed pair breaks the rules
//     //     def breakingElement = page.find { element ->
//     //         def reversedPair = [element, middle]     // Pair with reversed order
//     //         reversedPair in rules                    // Check if it breaks the rules
//     //     }

//     //     // Return the complementary element if rule-breaking exists, otherwise return middle number
//     //     breakingElement ?: middle
//     // }

//     // def result = pages.collect { page ->
//     //     def middleIndex = (page.size() - 1) / 2   // Find the middle index
//     //     def middle = page[middleIndex]           // Middle element

//     //     // Check if any pair with the middle element breaks the rules
//     //     def isRuleBroken = page.any { element ->
//     //         def reversedPair = [element, middle] // Reversed pair
//     //         reversedPair in rules                // Check against rules
//     //     }

//     //     // Return middle only if a rule is broken
//     //     isRuleBroken ? middle : null
//     // }.findAll { it != null } // Remove nulls where no rule was broken

//     // def result = pages.collect { page ->
//     //     def middleIndex = (page.size() - 1) / 2   // Find the middle index
//     //     def middle = page[middleIndex]           // Middle element

//     //     // Find the first reversed pair that breaks the rule
//     //     def breakingElement = page.findResult { element ->
//     //         def reversedPair = [element, middle]
//     //         reversedPair in rules ? element : null
//     //     }

//     //     // Return the reversed pair if a rule is broken
//     //     breakingElement
//     // }.findAll { it != null } // Remove nulls where no rule was broken


//     println result.sum()
// }


workflow {
    // Split on blank newline
    def (rules, pages) = file(params.data)
            .text
            .split(/\n\n/)

    // Split rules into pairs 1|2 -> [[1, 2]]
    rules = rules
        .readLines()
        .collect {
            it.split(/\|/, 2).collect { it as Long  }
        }

    // Split pages into arrays 1,2,3 [[1,2,3]]
    pages = pages.readLines()
        .collect { it.split(",").collect { it as Long  } }

    // Pileup all pages and check if reverse is never true
    def result = pages.collect { page ->
        // Track whether the page was corrected
        def wasCorrected = false

        // Correct reversed pairs in the page
        (0..<page.size()).each { idx ->
            ((idx + 1)..<page.size()).each { e ->
                if ([page[e], page[idx]] in rules) {
                    // Swap back to the correct order
                    def temp = page[idx]
                    page[idx] = page[e]
                    page[e] = temp
                    wasCorrected = true
                }
            }
        }

        // Return the middle number only if the page was corrected
        if (wasCorrected) {
            return page[(page.size() - 1) / 2]
        }
    }.findAll { it != null } // Filter out null values (pages that weren't corrected)

    println result.sum()
}

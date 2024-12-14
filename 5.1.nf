// take keyword args
params.data = "data/5.in"


// def (rules, pages) = file(params.data)
//             .text
//             .split(/\n\n/)

// rules = rules
//         .readLines()
//         .collect {
//             it.split(/\|/, 2).collect { it as Long  }
//         }

//         // .sort {
//         //     a, b ->
//         //     a[0] <=> b[0]
//         // }

// keys = rules.flatten().toSet()

// println keys

// keys = [35, 58]

// pages = pages.readLines()
//         .collect { it.split(",").collect { it as Long  } }

// This proves there are no elements in the pages that is not in keys
// println pages
//     .collect {
//         it - keys
//     }

// println rules

// println pages[0..2]
//         .collect {
//             (0..it.size() - 2)
//                 .collect {
//                     idx ->
//                     [it[idx], it[idx+1]] in rules
//                 }
//         }

// def result = pages  .collect { page ->
//     (0..<page.size()).collectMany { idx ->
//         ((idx + 1)..<page.size()).collect { e ->
//             def pair = [page[idx], page[e]]          // Original order
//             def reversedPair = [page[e], page[idx]] // Reversed order

//             // Check if the reversed pair exists in rules (rule-breaking condition)
//             if (reversedPair in rules) {
//                 pair // Collect the original pair breaking the rule
//             } else {
//                 null // Ignore pairs that don't break the rule
//             }
//         }.findAll { it != null } // Remove nulls (valid pairs that don't break rules)
//     }
// }

// def validPages = pages.findAll { page ->
//     // Check all pairs in the page
//     def noRulesBroken = (0..<page.size()).every { idx ->
//         ((idx + 1)..<page.size()).every { e ->
//             def pair = [page[idx], page[e]]          // Original pair
//             def reversedPair = [page[e], page[idx]] // Reversed pair

//             // The page is valid only if reversedPair is NOT in rules
//             !(reversedPair in rules)
//         }
//     }
//     noRulesBroken // Keep the page if no reversed rules are broken
// }

// println validPages

// println validPages.collect { page ->
//     def middleIndex = (page.size() - 1) / 2 // Find middle index
//     page[middleIndex]                      // Extract middle number
// }.sum()


workflow {
    // Split on blank newline
    // ^\n won't work with .text as it isn't the beginning but only in readLines which is not what we want here
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
    println pages
            .findAll {
                page ->
                (0..<page.size()).every {
                    idx ->
                    ((idx + 1)..<page.size()).every {
                        e ->
                        !([page[e], page[idx]] in rules)
                    }
                }
            }
            .collect {
                it[(it.size() - 1) / 2]
            }
            .sum()
}

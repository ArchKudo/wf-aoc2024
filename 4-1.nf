// read stuff from file
// take keyword args
params.data = "data/4.in"

// get bounded coordinates
// def bcoord (x,y,ux,uy) { 
    
//     h = [[x, Math.max(y - 3, 0)], [x,  Math.min(y + 3, uy)]]
//     v = [[Math.max(x - 3, 0), y], [Math.min(x+ 3, ux), y] ]
//     d = []

//     [[Math.max(x - 3, 0) , Math.max(y - 3, 0)], 
//     [Math.min(x+ 3, ux), Math.min(y + 3, uy)]] 
// } // [10, 10] -> [[7, 7], [9, 10]]  

// def barea(arr, i, j, coord) {
//     h = coord[0][0]
// }

            // .collect {
            //     it.split("")
            // }

    // xd = arr[0]
    
    // i = 0;
    // while (i < )

    // for (i = 0; i<xd.size(); i++) {
    //     if ! (xd[i..<i+4] == "SAMX" || xd[i..<i+4] == "XMAS") {
    //         xd[i] == "."
    //     }
    // }


        // For some reason I thought we had to give the modified table instead of the count
        //     .collect {
        //         it.replaceAll("SAMX", "1")
        //         .replaceAll("XMAS", "2")
        //         .replaceAll(/[A-Z]/, ".")
        //         .replaceAll("1", "SAMX")
        //         .replaceAll("2", "XMAS")
        //     }
        // .collect {
        //     it.split("")
        // }

    // y = arr.collect { it.split("") }.transpose().collect { it.join("") }
    //         .collect {
    //             it.replaceAll("SAMX", "1")
    //             .replaceAll("XMAS", "2")
    //             .replaceAll(/[A-Z]/, ".")
    //             .replaceAll("1", "SAMX")
    //             .replaceAll("2", "XMAS")
    //         }
    //         .collect {
    //             it.split("")
    //         }
    //         .transpose()
            // .collect {
            //     it.join("")
            // }
            // .collect {
            //     it.replaceAll(/\./, {match, index -> return index})
            // }
            // .collect(
            //     it.replaceAll(".", {match, index ->
            //         index
            //     })
            // }
    
    // println y[10][25]

    // x.eachWithIndex() {
    //     r, i ->
    //         r.eachWithIndex {
    //             println y[i][j]
    //         }
    // }




    // for (i = 0; i<x.size(); i++) {
    //     for (j = 0; j < x[i].size(); j++) {
    //         // println i + " " + j + " " + x[i][j] + " " + y[i][j]
    //         x[i][j] = x[i][j] == "." ? y[i][j] : x[i][j]
    //         // println x[i][j]
    //     }
    // }
    
    // println m





    // ux = arr.size()
    // uy = arr[0].size() // obv no checks to ensure all subarrays of same size

    // for (i = 0, ux=arr.size(); i<ux; i++) {
    //     for (j = 0, uy=arr[i].size(); j<uy; j++) {
    //         print(String.format("%s %s %s", i, j, arr[i][j]))
    //         print()
    //     }
    // }
    
    // println arr

// [["a", 	"b", 	"c", 	"d", ],
// ["e", 	"f", 	"g", 	"h", ],
// ["i", 	"j", 	"k", 	"l", ],
// ["m", 	"n", 	"o", 	"p", ],]

// b = []

// A chatgpt + geeksforgeeks monster

// def diagonals(arr) {
//     row = arr.size()
//     col = arr[0].size()

//     // row + col - 1 = total number of possible diagonals
//     (1..(row + col - 1)).each { diag ->
//         // Always start from 0th column
//         // Upper triangle will always be 0 i.e until diag == row
//         // lower triangle column will start increasing 
//         start_col = Math.max(0, diag - row)
//         // Number of possible elements in diagonal
//         // Upper triange diag==col, count of elements == diag
//         // lower triangle would start decreasing again
//         count = Math.min(diag, col - start_col)

//         // Now that the count of each diag's elems is known
//         (0..<count).each { j ->
//             // diag starts from 1: a 2: e 1: b
//             print "${arr[diag - j - 1][start_col + j]} "
//         }
//         println()
//     }
// }

// def rdiagonals(arr) {
//     def row = arr.size()
//     def col = arr[0].size()
    
//     // Loop over each diagonal index
//     (0..<(row + col - 1)).each { diag ->
//         def start_row = Math.max(0, row - 1 - diag)
//         def start_col = Math.max(0, diag - (row - 1))
        
//         def diagonalElements = []
        
//         while (start_row < row && start_col < col) {
//             diagonalElements << arr[start_row][start_col]
//             start_row++
//             start_col++
//         }
        
//         println diagonalElements.join(" ")
//     }
// }

// def bothDiagonals(arr) {
//     def row = arr.size()
//     def col = arr[0].size()
//     def forwardDiagonals = []
//     def reverseDiagonals = []

//     // Compute both forward and reverse diagonals
//     (0..<row + col - 1).each { diag ->
//         // Forward diagonal
//         def forwardStartRow = Math.max(0, diag - (row - 1))
//         def forwardStartCol = Math.max(0, row - 1 - diag)
//         def forwardDiagonal = []

//         while (forwardStartRow < row && forwardStartCol < col) {
//             forwardDiagonal << arr[forwardStartRow][forwardStartCol]
//             forwardStartRow++
//             forwardStartCol++
//         }
//         forwardDiagonals << forwardDiagonal.join("")

//         // Reverse diagonal
//         def reverseStartRow = Math.max(0, row - 1 - diag)
//         def reverseStartCol = Math.max(0, diag - (row - 1))
//         def reverseDiagonal = []

//         while (reverseStartRow < row && reverseStartCol < col) {
//             reverseDiagonal << arr[reverseStartRow][reverseStartCol]
//             reverseStartRow++
//             reverseStartCol++
//         }
//         reverseDiagonals << reverseDiagonal.join("")
//     }

//     return forwardDiagonals + reverseDiagonals
// }

// Has some range bug
// def bothDiagonals(arr) {
//     def row = arr.size()
//     def col = arr[0].size()
//     def forwardDiagonals = []
//     def reverseDiagonals = []

//     // Compute both forward and reverse diagonals
//     (0..<row + col - 1).each { diag ->
//         // Forward diagonal
//         def forwardStartRow = Math.max(0, diag - (row - 1))
//         def forwardStartCol = Math.max(0, row - 1 - diag)
//         def forwardDiagonal = []

//         while (forwardStartRow < row && forwardStartCol < col) {
//             forwardDiagonal << arr[forwardStartRow][forwardStartCol]
//             forwardStartRow++
//             forwardStartCol++
//         }
//         forwardDiagonals << forwardDiagonal.join("")

//         // Reverse diagonal
//         def reverseStartRow = Math.max(0, row - 1 - diag)
//         def reverseStartCol = Math.max(0, diag - (row - 1))
//         def reverseDiagonal = []

//         while (reverseStartRow < row && reverseStartCol < col) {
//             reverseDiagonal << arr[reverseStartRow][reverseStartCol]
//             reverseStartRow++
//             reverseStartCol++
//         }
//         reverseDiagonals << reverseDiagonal.join("")
//     }

//     return forwardDiagonals + reverseDiagonals
// }

// workflow {
//     arr = file(params.data)
//             .readLines()

//     x = arr
//         .collect {
//             it.findAll(/SAMX/) + it.findAll(/XMAS/)
//         }
//         .flatten()
//         .size()

//     y = arr.collect { it.split("") }.transpose().collect { it.join("") }.join("\n")
//             .collect {
//             it.findAll(/SAMX/) + it.findAll(/XMAS/)
//         }
//         .flatten()
//         .size()
    
//     // println y

//     d = bothDiagonals(arr).collect {
//             it.findAll(/SAMX/) + it.findAll(/XMAS/)
//         }
//         .flatten()
//         .size()

//     // println d
//     // d = bothDiagonals(arr)

//     // d=bothDiagonals(arr)
//     // d.each { println it }
//     // r = rdiagonals(arr)


//     // println arr[4] + " " + x
//     // println x + " " + y + " " + d

//     println x + y + d

//     // println arr.size()
//     // arr.each {
//     //     println it.size()
//     // }

//     // println d.size()
//     // println d.sort { it.size() }


// }

// Chatgpt somehow fixed the bug in my code, need to revisit
def bothDiagonals(arr) {
    def row = arr.size()
    def col = arr[0].size()
    def forwardDiagonals = []
    def reverseDiagonals = []

    // Compute both forward and reverse diagonals
    (-(row - 1)..<col).each { diag -> // Index range covers all diagonals
        def forwardDiagonal = []
        def reverseDiagonal = []

        // Forward diagonal: Top-left to bottom-right
        (0..<row).each { r ->
            def c = diag + r
            if (c >= 0 && c < col) {
                forwardDiagonal << arr[r][c]
            }
        }
        if (!forwardDiagonal.isEmpty()) forwardDiagonals << forwardDiagonal.join("")

        // Reverse diagonal: Bottom-left to top-right
        (0..<row).each { r ->
            def c = diag + (row - 1 - r)
            if (c >= 0 && c < col) {
                reverseDiagonal << arr[r][c]
            }
        }
        if (!reverseDiagonal.isEmpty()) reverseDiagonals << reverseDiagonal.join("")
    }

    return forwardDiagonals + reverseDiagonals
}

workflow {
    // Parse input into an array of strings
    def arr = file(params.data)
                .readLines()
                .collect { it.split("") } // Convert rows to character arrays

    // Horizontal matches
    def x = arr.collect { it.join("") }
               .collect { it.findAll(/(?=(SAMX|XMAS))/).size() } // Use regex with lookahead for overlaps
               .sum()

    // Vertical matches (using transpose)
    def transposed = arr.transpose()
    def y = transposed.collect { it.join("") }
                      .collect { it.findAll(/(?=(SAMX|XMAS))/).size() }
                      .sum()

    // Diagonal matches
    def diagonals = bothDiagonals(arr)
    def d = diagonals.collect { it.findAll(/(?=(SAMX|XMAS))/).size() }
                     .sum()

    println "Horizontal Matches: $x"
    println "Vertical Matches: $y"
    println "Diagonal Matches: $d"
    println "Total Matches: ${x + y + d}"
}
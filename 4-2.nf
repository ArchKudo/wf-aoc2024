// original broken code before asking cgpt to fix my code:
// read stuff from file
// take keyword args
// params.data = "data/4.in"

// def diags (arr) {

//     rows = arr.size()
//     cols = arr[0].size()

//     (1..<(rows - 1)).collectMany {
//         row ->
//         (1..<(cols - 1)).collect {
//             col ->
//             if (arr[row][col] == 'A') {
//                 // println "Ma: ${[row - 1,col + 1]} + ${[row, col]} + ${[row + 1, col - 1]}" // .join("")
//                 // println "Mi: ${[row - 1, col - 1]} + ${[row, col]} + ${[row + 1, row + 1]}" // .join("")                
//                 // println "Ma: ${arr[row - 1][col + 1] + arr[row][col] + arr[row + 1][col - 1]}" // .join("")
//                 // println "Mi: ${arr[row - 1][col - 1]} + ${arr[row][col]} + ${arr[row + 1][row + 1]}" // .join("")
//                 diag = [
//                     (arr[row - 1][col + 1] + arr[row][col] + arr[row + 1][col - 1]),
//                     (arr[row - 1][col - 1] + arr[row][col] + arr[row + 1][row + 1])
//                 ]
                
//                  diag.every { it ==~ /SAM|MAS/ } ? diag : null

//             }
//         }    .findAll {
//         it != null
//     }.findAll {
//         it != null
//     }


//     }

// }

// workflow {
//     def arr = file(params.data)
//             .readLines()
//             .collect { it.split("") }
    
//     println diags(arr).size()
//     // diags(arr)
// }


// read stuff from file
// take keyword args
params.data = "data/4.in"

def countXMAS(arr) {
    int rows = arr.size()
    int cols = arr[0].size()
    int count = 0

    (1..<(rows - 1)).each { row ->
        (1..<(cols - 1)).each { col ->
            if (arr[row][col] == 'A') {
                // Diagonal 1: top-left to bottom-right
                def diag1 = arr[row - 1][col - 1] + arr[row][col] + arr[row + 1][col + 1]

                // Diagonal 2: top-right to bottom-left
                def diag2 = arr[row - 1][col + 1] + arr[row][col] + arr[row + 1][col - 1]

                // Check if both diagonals match "MAS" or "SAM"
                if ((diag1 ==~ /MAS|SAM/) && (diag2 ==~ /MAS|SAM/)) {
                    count++
                }
            }
        }
    }
    return count
}

// Workflow to process the input file and count X-MAS patterns
workflow {
    def arr = file(params.data)
        .readLines()
        .collect { it.toList() } // Split into character arrays
    
    println countXMAS(arr)
}
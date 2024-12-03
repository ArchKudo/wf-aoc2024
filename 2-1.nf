// Relevant bits from 1-1

params.data = "data/2.in"

// arr = file(params.data)

// collect to get all items
// using each performs the operation but doesn't collect
// using eachLine only returns last item
// x = arr.readLines().collect { it.split(" ").collect { it as Long } }
// y = x[0]

// println y[0].getClass()

// println y + "\n" +  y[1..-1]

// println y[1..-1] + "\n" + y[0..-2]

// println y[0..-2].indices.collect { i -> y[i+1] - y[i]}

// diff = y[0..-2]
//     .indices
//     .collect { i -> y[i+1] - y[i]}

// println diff.every { it < 3 && (Math.signum(it) == Math.signum(diff[0])) }

// println x.collect { sublist -> 
//     def diff = sublist[0..-2]
//         .indices
//         .collect { i -> sublist[i + 1] - sublist[i] }
//     diff.every { it <= 3 && Math.signum(it) == Math.signum(diff[0]) }
// }.count(true)

// The requirement are -3 to 3 excluding 0 and should be either increasing or decreasing

workflow {
     println file(params.data)
            // Split by lines
            .readLines()
            // Split line again by space get the resulting elements as long
            .collect { it.split(" ").collect { it as Long } }
            .collect {
                e ->
                // Get element wise difference of e[1:] -* e[:-2]
                def diff = e[0..-2]
                            .indices
                            .collect { i -> e[i + 1] - e[i] }
                // exclude everything that doesn't meet requirements
                diff.every { it != 0 && it <= 3 && it >= -3 && Math.signum(it) == Math.signum(diff[0]) }
            }
            // count true values
            .count(true)
            // .each { println it}
}



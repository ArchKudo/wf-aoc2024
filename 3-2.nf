// read stuff from file
// take keyword args
params.data = "data/3.in"

workflow {

        filter = file(params.data)
                .getText()
                // Split into whether it has do and don't ?= is fwd seek ig.
                // https://stackoverflow.com/a/2206432
                .split( /(?=do\(\)|don't\(\))/ )
                // https://stackoverflow.com/a/28493756
                .findAll { !it.startsWith("don't") }
                // Convert it back to a single string
                .join("")
        
        // Other attempts include non greedy matching i.e
        // mul1domul2dontmul3 -> would do only 2
        // Greedy matching
        // mul1mul1domul2dontmul3mul4 -> would do only 4 
        // matches = txt =~ patt

        // println matches
                    // .collect { [(it[1]), (it[3] as long), (it[4] as long)] }
                    // .split { /(do\(\)|don't\(\))/ }
                    // .collect { it[1] == "don't()" ? (it[3] as long) * (it[4] as long) : 0 }

                    // .sum()
        
        //Previous code 3-1.nf
        matches = filter =~ /(mul)\((\d+)\,(\d+)\)/

        println matches
            .collect { (it[2] as long) * (it[3] as long) }
            .sum()


                // .each {
                //     matches = it =~ /mul\((\d+)\,(\d+)\)/
                //     matches
                // }
                // .

        // println matches

        // println matches[0][3]
}


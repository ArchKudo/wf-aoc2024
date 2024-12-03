// Relevant bits from 2-1

params.data = 'data/2.in'

// Get all combinations of array with one element removed
def subsets(arr) {
    s = [arr[0..-2], arr[1..-1]]
    for (i=1; i<arr.size()-1;i++) {
        s << arr[0..i-1] + arr[i+1..-1]
    }
    s
}

workflow {
    ans = file(params.data)
            .readLines()
            .collect { it.split(' ').collect { it as Long } }
            .collect {
                e ->

                // Calculate diff
                def diff =  { it[0..-2].indices.collect { i -> it[i + 1] - it[i] } }

                // Check if matches all rules
                def rules = { it, delta -> it != 0 && it <= 3 && it >= -3 && Math.signum(it) == Math.signum(delta[0]) }
                
                // calculate first delta
                def delta = diff(e)
                
                // Check if the first diff matches all rules
                res = delta.collect { rules (it, delta) }

                if (res.count { !it } == 0) {
                    true
                } else  {
                    // earlier i was checking for res.count { !it } == 0 but it leads to lesser results
                    // before that I wasn't checking all combinations

                    // idx = res.findIndexOf { !it }
                    // e.remove(idx+1)
                    // delta = diff(e)
                    // delta.every { rules(it, delta) }
                    // e + res + delta + delta.every { rules(it, delta) }
                    // (0..<e.length).collect {
                    //     delta = diff(e - e[i])
                    //     delta.every { rules(it, delta) } ? (e - e[i]) : false
                    // }
                    
                    subsets(e).collect {
                        delta = diff(it)
                        delta.every { rules(it, delta) } ? it : false
                    }.any {it}
                } 
                // else {
                //     // e + res + delta
                //     false
                // }

                // if the result has one falsy get the index


                // if 

                // delta
                
                // diff.every { it != 0 && it <= 3 && it >= -3 && Math.signum(it) == Math.signum(diff[0]) }
                // diff.count { it == 0 || Math.signum(it) != Math.signum(diff[0]) } == 1 ? diff : null
                // diff.count { rule(it, diff) } == 1 ? diff.findAll { !rule(it, diff) }.every { rule(it, diff) } : false

            }
            .count(true)
            // .eachWithIndex { e, i -> if (e != null) {println i + " " + e} }
println ans
}

// Splitting string into array
// println "123   345".tokenize("   ")

// working with file


// read stuff from file
// take keyword args
params.data = "data/1.in"

// chan = file(params.data)

// println chan.readLines()


// iterate through files
// println chan.getText()

// convert file to array 
// println chan.getText().split("   ")

// split array into two different cols

// println chan.getText().split("   ").toList().withIndex()

// arr = chan.getText().split(/\s{3}|\n/)

// (0..<arr.length).each {println it}
// (0..arr.length) => gives 0.1001 we want 0..1000

// (0..<arr.length).findAll { it % 2 == 0 }.collect { arr[it] }.each {println it}
// (0..<arr.length).findAll { it % 2 != 0}.collect { arr[it] }.each {println it}

// col1 = (0..<arr.length).findAll { it % 2 == 0 }.collect { arr[it] }.sort()
// col2 = (0..<arr.length).findAll { it % 2 != 0}.collect { arr[it] }.sort()

// println col2

// println (col1[1] as long).getClass()

// println col1.indices.collect {idx -> Math.abs((col1[idx] as long) - (col2[idx] as long)) }.sum()

workflow {
        arr = file(params.data)
                .getText() // Get the entire text
                .split(/\s{3}|\n/) // Split either at three spaces or new line
        // Get the first column
        f = (0..<arr.length).findAll { it % 2 == 0 }.collect { arr[it] }.sort()
        // Get second column
        s = (0..<arr.length).findAll { it % 2 != 0}.collect { arr[it] }.sort()
        // Calculate the absolute difference between two
        ans = f.indices.collect {idx -> Math.abs((f[idx] as long) - (s[idx] as long)) }.sum()
        println ans
}
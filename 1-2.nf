// Relevant bits from 1-1

params.data = "data/1.in"



workflow {
    arr = file(params.data)
        .getText() // Get the entire text
        .split(/\s{3}|\n/) // Split either at three spaces or new line
    // Get the first column
    f = (0..<arr.length).findAll { it % 2 == 0 }.collect { arr[it] }.sort()
    // Get second column
    s = (0..<arr.length).findAll { it % 2 != 0}.collect { arr[it] }.sort()

    println f.collect { (it as long) * s.count(it) }.sum()
}


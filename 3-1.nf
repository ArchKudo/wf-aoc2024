// read stuff from file
// take keyword args
params.data = "data/3.in"

workflow {

        txt = file(params.data)
                .getText() // Get the entire text

                // Earlier I tried with findall but couldn't collect groups as op = string
                // .findAll( /(mul)\((\d+)\,(\d+)\)/ )
                // .collect {
                //     it.getClass()
                // }
        
        // pattern to match mul(123,345)
        matches = txt =~ /(mul)\((\d+)\,(\d+)\)/ 

        println matches
            // get the group 2 and 3 as long
            .collect { (it[2] as long) * (it[3] as long) }
            // add all
            .sum()

        // println matches[0][3]
}


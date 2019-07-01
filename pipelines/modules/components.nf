nextflow.preview.dsl=2


def basic_sum(a, b) {
    return a + b
}


process hello_world {

    output:
    stdout()

    script:
    """
    #!/usr/bin/env bash

    echo 'hello world'
    """
}


process passed_parameters {

    script:
    """
    #!/usr/bin/env bash

    echo ${params.foo}
    """
}


process compose_a {

    output:
    file 'foo.txt'

    script:
    """
    #!/usr/bin/env bash

    echo "foo bar" > foo.txt
    """

}


process compose_b {

    input:
    file x

    output:
    null

    script:
    """
    echo 'compose_b'
    """
}

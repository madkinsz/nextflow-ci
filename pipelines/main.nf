nextflow.preview.dsl=2

include 'modules/components.nf' params(foo: "bar")

ch_hello_world = hello_world()
ch_hello_world.view()

composed_pipeline = (compose_a | compose_b)

composed_pipeline.view()

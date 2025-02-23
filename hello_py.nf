# If you're not completely comfortable with the bash code used in the example, don't worry! 
# You can use whatever programming language you like within Nextflow script blocks.
# For example, the hello_py.nf file contains the same example but using Python code:


"""
    #!/usr/bin/env python
    x="$x"
    for i, word in enumerate(x.split()):
        with open(f"chunk_{i}", "w") as f:


    script:
    """
    #!/usr/bin/env python

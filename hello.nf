#!/usr/bin/env nextflow

params.greeting = 'Hello world!' 
greeting_ch = Channel.of(params.greeting) 

# Initializes a channel labeled greeting_ch, which contains the value from params.greeting. Channels are the input type for processes in Nextflow.
  
process SPLITLETTERS { 
    input: 
    val x 

    output: 
    path 'chunk_*' 

    script: 
# Three double quotes start and end the code block to execute this process. Inside is the code to execute — printing the input value 'x' (called using the dollar symbol [$] prefix), splitting the string into chunks with a length of 6 characters ("Hello " and "world!"), and saving each to a separate file (chunk_aa and chunk_ab).
    """
    printf '$x' | split -b 6 - chunk_
    """
} 

# Beginning of the second process block
process CONVERTTOUPPER { 
    input: 
    path y 

    output: 
    stdout 

    script: 
    """
    cat $y | tr '[a-z]' '[A-Z]'
    """
} 

#  Start of the workflow scope where each process can be called.
workflow { 
    letters_ch = SPLITLETTERS(greeting_ch) 
    results_ch = CONVERTTOUPPER(letters_ch.flatten()) 
    results_ch.view { it } 
} 

# OpenGL in Ceylon with JOGL

This small example demonstrates how to use OpenGL in Ceylon
courtesy of [JOGL][].

[JOGL]: http://jogamp.org/

## Requirements

Ceylon 1.3.3 or Ceylon IDE 1.3.3 is required to compile and
run this example. On the command line you can use the provided
`ceylonb` command if you don't have Ceylon already installed.

## Compiling and running

Compile the example with `ceylon` or `ceylonb`:

    ./ceylonb compile

Next, run the example with `ceylon` or `ceylonb`:

    ./ceylonb run

Alternatively, simply import the project into Ceylon IDE and
run it from within the IDE.

## Assembling a fat jar

Assemble a "fat" jar containing the example module with 
all its dependencies with `ceylon` or `ceylonb`:

    ./ceylonb fat-jar joggly

Now, run the fat jar using `java`:

    java -jar joggly-1.0.0.jar

## Packaging a Ceylon assembly archive

Package the example module as a `.cas` assembly archive 
using `ceylon` or `ceylonb`:

    ./ceylonb assemble joggly

And then run it using `ceylon` or `ceylonb`:

    ./ceylonb run -a joggly-1.0.0.cas
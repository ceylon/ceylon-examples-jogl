# OpenGL in Ceylon with JOGL

This small example demonstrates how to use OpenGL in Ceylon
courtesy of [JOGL].

[JOGL]: http://jogamp.org/

## Requirements

Ceylon 1.3.1 or Ceylon IDE 1.3.1 is required.

Maven is also required.

## Compiling and running

First, you must use Maven to fetch the JNI native libraries
required by JOGL. In this directory, type:

    mvn dependency:resolve

Next, compile the example with `ceylon`:

    ceylon compile

Finally, run it using:

    ceylon run joggly

Alternatively, simply import the project into Ceylon IDE and
run it from within the IDE.

## Gotcha: native library jar files

Ceylon's Maven integration does not yet automatically 
download the JNI native libraries required by JOGL. 
Therefore it is necessary to use Maven for this. For more
information see <https://jogamp.org/wiki/index.php/Maven>.
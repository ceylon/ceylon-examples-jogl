
native("jvm")
module joggly "1.0.0" {
    import java.desktop "8";

    import maven:org.jogamp.jogl:"jogl-all" "2.3.2";
    import maven:org.jogamp.gluegen:"gluegen-rt" "2.3.2";

    // We could define native dependencies here, but we
    // prefer to do it in overrides.xml, since, at least in
    // principle, native dependencies are assembly-specific.
    // So we leave the following module imports commented:

//    import maven:org.jogamp.jogl:"jogl-all":"natives-macosx-universal" "2.3.2";
//    import maven:org.jogamp.jogl:"jogl-all":"natives-linux-i586" "2.3.2";
//    import maven:org.jogamp.jogl:"jogl-all":"natives-windows-i586" "2.3.2";

//    import maven:org.jogamp.gluegen:"gluegen-rt":"natives-macosx-universal" "2.3.2";
//    import maven:org.jogamp.gluegen:"gluegen-rt":"natives-linux-i586" "2.3.2";
//    import maven:org.jogamp.gluegen:"gluegen-rt":"natives-windows-i586" "2.3.2";
}

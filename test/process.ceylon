void testProcess() {
    // basically just test if everything can be called without error
    Void args = process.arguments;
    if (is Void[] args) {
        for (arg in args) {
            check(is String arg, "process.arguments");
        }
    } else {
        fail("process.arguments is no sequence");
    }
    Void argPresent = process.namedArgumentPresent("");
    check(is Boolean argPresent, "process.namedArgumentPresent");
    check(!(exists process.namedArgumentValue("")), "process.namedArgumentValue");
    String? filesep = process.propertyValue("file.separator");
    if (exists filesep) {
        check((filesep=="/")||(filesep=="\\"), "process.propertyValue");
    } else {
        fail("process.propertyValue (null)");
    }
    check(process.newline.contains(`\n`), "process.newline");
    process.write("test write");
    process.writeLine(" and writeLine");
    process.writeError("test writeError");
    process.writeErrorLine(" and writeErrorLine");
    print("Process VM " process.vm " version " process.vmVersion " on " process.os " v" process.osVersion "");
    check(process.milliseconds > 0, "process.milliseconds");
    check(process.nanoseconds > 0, "process.milliseconds");

    //language object
    check(language.version=="0.4", "language.version");
    check(language.majorVersion==0, "language.majorVersion");
    check(language.minorVersion==4, "language.minorVersion");
    check(language.releaseVersion==0, "language.releaseVersion");
    check(nonempty language.versionName, "language.versionName");
    check(language.majorVersionBinary==3, "language.majorVersionBinary");
    check(language.minorVersionBinary==0, "language.minorVersionBinary");
    print("Ceylon language version " language.version " major " language.majorVersion
        " minor " language.minorVersion " release " language.releaseVersion
        " '" language.versionName "' major bin " language.majorVersionBinary " minor bin "
        language.minorVersionBinary "");
    check(process.string == "process", "process.string");
    check(language.string == "language", "language.string");
}


This project shows **broken** incremental compilation in SBT while using the configuration option:

```scala
    unmanagedResourceDirectories in Compile <+= baseDirectory( _ / "src/main/scala" )
```

**Reproducing:**

One alternative, you can just run ./reproduce.sh which will reproduce all the steps below (if you have Linux or Mac).

Reproducing by manually editing the files:

1. Launch SBT
2. Use `;reload ;clean ;~test:compile`
3. Observe the project building successfully (2 source files).
4. In Usage.scala, comment out the method. Save the file.
5. Observe the project re-building successfully. Now uncomment the line back again and save.
6. In Implicits.scala, comment out method. Save the file
7. Observe the project re-building successfully (but it shouldn't, see below).

**Expected:**

The project should NOT compile at step 7. `MyImplicits.stringToInt` is undoubtedly used in `Usage.scala`.

**Where does this bug come from:**

This build.sbt line is recommended by the (proprietary) Takipi error analyzer: https://support.overops.com/hc/en-us/articles/217928988-Viewing-Source-Code#SBT

I do not fully understand how `unmanagedResourceDirectories` works, so that could be both an SBT bug or Takipi suggesting the wrong settings.

I would very much appreciate any help. Is this a bug in SBT?

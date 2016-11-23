
This project shows **broken** incremental compilation in SBT while using the configuration option:

```scala
    unmanagedResourceDirectories in Compile <+= baseDirectory( _ / "src/main/scala" )
```

**Reproducing:**

1. Launch SBT
2. Use `;reload ;clean ;~test:compile`
3. Observe the project building successfully (2 source files).
4. In Usage.scala, comment out the line   `def a: Int = ""`  Save the file
5. Observe the project re-building successfully. Now uncomment the line back again and save.
6. In Implicits.scala, comment out the line `implicit def stringToInt(str: String) = 1` Save the file
7. Observe the project re-building successfully (but it shouldn't, see below).

**Expected:**

Actually, the project should NOT compile at step 7. This method is actually _used_ in Usage.scala. So Usage.scala should not be able to compile itself at step 7.

**Where does this bug come from:**

This line is recommended by the (proprietary) Takipi error analyzer: https://support.overops.com/hc/en-us/articles/217928988-Viewing-Source-Code#SBT

I do not fully understand how `unmanagedResourceDirectories` works, so that could be both an SBT bug or Takipi suggesting the wrong settings.

I would very much appreciate any help. Is this a bug in SBT?
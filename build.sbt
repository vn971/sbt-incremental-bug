
scalaVersion in ThisBuild := "2.10.6"

unmanagedResourceDirectories in Compile <+= baseDirectory( _ / "src/main/scala" ) //For takipi error analyzer

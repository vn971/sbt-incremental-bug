#!/bin/bash

echo "======== restoring normal file tree"
cp -a incremental-steps/UncommentedUsage.scala src/main/scala/Usage.scala
cp -a incremental-steps/UncommentedImplicits.scala src/main/scala/Implicits.scala
sbt clean test:compile

echo "======== commenting out Usage"
cp -a incremental-steps/CommentedUsage.scala src/main/scala/Usage.scala
sbt test:compile

echo "======== uncommenting back"
cp -a incremental-steps/UncommentedUsage.scala src/main/scala/Usage.scala
sbt test:compile

echo "======== commenting out Implicits"
cp -a incremental-steps/CommentedImplicits.scala src/main/scala/Implicits.scala
sbt test:compile
echo "======== SBT exit code is $?, but should be unsuccessful."
echo "======== SBT should not be able to compile the project with the last step."

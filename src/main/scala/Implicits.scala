import scala.language.implicitConversions

object MyImplicits {
  implicit def stringToInt(str: String) = 1
  def cyclic = MyUsage.cyclic
}

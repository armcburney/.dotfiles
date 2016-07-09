package example

import scala.scalajs.js
import org.scalajs.dom
import shared.SharedMessages

object Main extends js.JSApp {
  def main(): Unit = {
    println("Frontend test.");
    dom.document.getElementById("scalajsShoutOut").textContent = SharedMessages.itWorks
  }
}

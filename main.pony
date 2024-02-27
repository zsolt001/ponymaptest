use "collections"
use "logger"

class MyMapKey is (Hashable & Equatable[MyMapKey])
  let stateName: String
  let eventName: String

  new create(s: String, e:String) =>
    stateName = s
    eventName = e

  fun hash():USize =>
    let k = stateName + eventName
    k.hash()

  fun eq(that: box->MyMapKey):Bool =>
    (stateName == that.stateName) and (eventName == that.eventName)


actor Main
  new create(env: Env) =>
    let logger = StringLogger(Warn, env.out)
    logger.log("Map Test has started")

    var testmap : Map[MyMapKey, String]
    testmap = HashMap[MyMapKey, String, HashEq[MyMapKey]]

#!groovy

library "github.com/melt-umn/jenkins-lib"

melt.setProperties(silverBase: true)

melt.trynode('ableC') {
  def ABLEC_BASE = env.WORKSPACE
  def SILVER_BASE = silver.resolveSilver()
  def newenv = silver.getSilverEnv(SILVER_BASE)

  stage ("Build") {

    checkout scm

    melt.clearGenerated()

    withEnv(newenv) {
      sh './build --mwda'
    }
  }

  stage ("Modular Analyses") {
    // Run the MDA for the Silver extension for construcing ableC ASTs.
    // MWDA is already run in the build step above
    withEnv(newenv) {
      sh "./mda-test"
    }
  }

  stage ("Test") {
    dir("testing") {
      withEnv(newenv) {
        sh "./build-test-artifact"
        sh "./runTests"
      }
    }
  }

  // Avoid deadlock condition from all executors being filled with builds
  // that are waiting for downstream builds to finish.
  waitUntil { melt.isExecutorAvailable() }

  stage ("Integration") {
    // All known, stable extensions to build downstream
    def extensions = [
      "ableC-skeleton", "ableC-lib-skeleton", "ableC-dep-skeleton",
      // "ableC-constructor",
      "ableC-condition-tables",
      "ableC-sqlite",
      // "ableC-allocation",
      "ableC-halide",
      
      // Treat ableP like an extension since it depends on ableC
      // "ableP",
    ]
    /*
      "ableC-sample-projects",
      "ableC-closure",
      "ableC-refcount-closure",
      "ableC-string",
      "ableC-vector",
      "ableC-halide",
      "ableC-interval",
      "ableC-watch",
      "ableC-cilk",
      "ableC-nondeterministic-search", "ableC-nondeterministic-search-benchmarks",
      "ableC-algebraic-data-types", "ableC-template-algebraic-data-types"
     */

    def tasks = [:]
    def newargs = [SILVER_BASE: SILVER_BASE, ABLEC_BASE: ABLEC_BASE]
    tasks << extensions.collectEntries { t ->
      [(t): { melt.buildProject("/melt-umn/${t}", newargs) }]
    }
    
    parallel tasks
  }

  /* If we've gotten all this way with a successful build, don't take up disk space */
  melt.clearGenerated()
}

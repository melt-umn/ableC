#!groovy

library "github.com/melt-umn/jenkins-lib"

melt.setProperties(silverBase: true)

melt.trynode('ableC') {
  def ABLEC_BASE = env.WORKSPACE
  def ABLEC_GEN = "${ABLEC_BASE}/generated"
  def SILVER_BASE = silver.resolveSilver()
  def newenv = silver.getSilverEnv(SILVER_BASE)
  def SILVER_HOST_GEN = []
  if (params.SILVER_GEN != 'no') {
    echo "Using existing Silver generated files: ${params.SILVER_GEN}"
    SILVER_HOST_GEN << "${params.SILVER_GEN}"
  }
  newenv << "SILVER_HOST_GEN=${SILVER_HOST_GEN.join(':')}"

  stage ("Build") {

    checkout scm

    melt.clearGenerated()

    withEnv(newenv) {
      sh './build ${SVFLAGS} --warn-all --warn-error'
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
    def extensions = [/* Disabled for now:
      "silver-ableC",
      "ableC-skeleton", "ableC-lib-skeleton",
      "ableC-constructor",
      "ableC-checkBounds",
      "ableC-checkTaggedUnion",
      "ableC-condition-tables",
      "ableC-dimensionalAnalysis",
      "ableC-nonnull",
      "ableC-sqlite",
      "ableC-templating",
      
      // Treat ableP like an extension since it depends on ableC
      "ableP",
    */]
    /* These are now downstream of silver-ableC, so we don't build them here:
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
    // SILVER_GEN should get inherited automatically
    def newargs = [SILVER_BASE: SILVER_BASE, ABLEC_BASE: ABLEC_BASE, ABLEC_GEN: ABLEC_GEN]
    tasks << extensions.collectEntries { t ->
      [(t): { melt.buildProject("/melt-umn/${t}", newargs) }]
    }
    
    parallel tasks
  }

  /* If we've gotten all this way with a successful build, don't take up disk space */
  melt.clearGenerated()
}

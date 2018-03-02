#!groovy

library "github.com/melt-umn/jenkins-lib"

melt.setProperties(silverBase: true)

node {
try {

  def ABLEC_BASE = pwd()
  def ABLEC_GEN = "${ABLEC_BASE}/generated"
  def newenv = melt.getSilverEnv()

  stage ("Build") {

    checkout scm

    melt.clearGenerated()

    withEnv(newenv) {
      sh './build ${SVFLAGS} --warn-all --warn-error'
    }
  }

  stage ("Tutorials") {
    dir("tutorials") {
      withEnv(newenv) {
        sh "./build-all"
      }
    }
  }

  stage ("Extensions") {
    def extensions = [
      "ableC-skeleton", "ableC-lib-skeleton", "ableC_sample_projects",
      "ableC-algebraic-data-types",
      "ableC-checkBounds",
      "ableC-cilk",
      "ableC-closure",
      "ableC-condition-tables",
      "ableC-dimensionalAnalysis",
      "ableC-halide",
      "ableC-interval",
      "ableC-nonnull",
      "ableC-sqlite",
      "ableC-string",
      "ableC-templating",
      "ableC-vector",
      "ableC-watch"
    ]

    def tasks = [:]
    for (t in extensions) { tasks[t] = task_extension(t, ABLEC_BASE, ABLEC_GEN) }

    parallel tasks
  }

  stage ("Test") {
    dir("testing/expected-results") {
      withEnv(newenv) {
        sh "./runTests"
      }
    }
  }

  /* If we've gotten all this way with a successful build, don't take up disk space */
  melt.clearGenerated()

}
catch (e) {
  melt.handle(e)
}
finally {
  melt.notify(job: 'ableC')
}
} // node


def task_extension(extension_name, ABLEC_BASE, ABLEC_GEN) {
  return {
    // Try to build a branch with the same name, otherwise fallback to develop
    def jobname = "/melt-umn/${extension_name}/${hudson.Util.rawEncode(env.BRANCH_NAME)}"
    if (env.BRANCH_NAME != 'develop' && !melt.doesJobExist(jobname)) {
      jobname = "/melt-umn/${extension_name}/develop"
    }
    // SILVER_BASE should get inherited automatically
    melt.buildJob(jobname, [ABLEC_BASE: ABLEC_BASE, ABLEC_GEN: ABLEC_GEN])
  }
}


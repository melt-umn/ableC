#!groovy

/* Set the properties this job has.
   I think there's a bug where the very first run lacks these... */
properties([
  /* Set our config to take a parameter when a build is triggered.
     We should always have defaults, I don't know what happens when
     it's triggered by a commit without a default... */
  [ $class: 'ParametersDefinitionProperty',
    parameterDefinitions: [
      [ $class: 'StringParameterDefinition',
        name: 'SILVER_BASE',
        defaultValue: '/export/scratch/melt-jenkins/custom-silver/',
        description: 'Silver installation path to use. Currently assumes only one build machine. Otherwise a path is not sufficient, we need to copy artifacts or something else.'
      ]
    ]
  ],
  /* If we don't set this, everything is preserved forever.
     We don't bother discarding build logs (because they're small),
     but if this job keeps artifacts, we ask them to only stick around
     for awhile. */
  [ $class: 'BuildDiscarderProperty',
    strategy:
      [ $class: 'LogRotator',
        artifactDaysToKeepStr: '120',
        artifactNumToKeepStr: '20'
      ]
  ]
])

/* If the above syntax confuses you, be sure you've skimmed through
   https://github.com/jenkinsci/pipeline-plugin/blob/master/TUTORIAL.md

   In particular, Jenkins has this thing that turns a map with a '$class' property
   into an actual object of that type, with the remainder of the map being its
   parameters. */


/* a node allocates an executor to actually do work */
node {
  try {
    //    notifyBuild('STARTED')
    
    def env = [
      "PATH=${params.SILVER_BASE}/support/bin/:${params.SILVER_BASE}/support/nailgun/:${env.PATH}",
      "SVFLAGS=-G ${WORKSPACE}/generated"
    ]

    /* stages are pretty much just labels about what's going on */
    stage ("Build") {
      /* Clean Silver-generated files from previous builds in this workspace */
      sh "rm -rf generated/* || true"

      checkout scm

      /* Checkout sometimes(?) cleans out the workspace, so create this afterwards */
      sh "mkdir -p generated"

      /* env.PATH is the master's path, not the executor's */
      withEnv(env) {
        sh "./build -G ${WORKSPACE}/generated --warn-all --warn-error"
      }
    }

    /* Make sure the tutorials compile before bothering to build all the other extensions */
    stage ("Tutorials") {
      dir("tutorials") {
        withEnv(env) {
          sh "./build-all"
        }
      }
    }

    stage ("Extensions") {
      parallel(
        "ableC-skeleton": {
          buildExtension("/melt-umn/ableC-skeleton")
        },
        "ableC-lib-skeleton": {
          buildExtension("/melt-umn/ableC-lib-skeleton")
        },
        "ableC-sqlite": {
          buildExtension("/melt-umn/ableC-sqlite")
        },
        "ableC-condition-tables": {
          buildExtension("/melt-umn/ableC-condition-tables")
        },
        "ableC-interval": {
          buildExtension("/melt-umn/ableC-interval")
        },
        "ableC-cilk": {
          buildExtension("/melt-umn/ableC-cilk")
        },
        "ableC-halide": {
          buildExtension("/melt-umn/ableC-halide")
        },
        "ableC-closure": {
          buildExtension("/melt-umn/ableC-closure")
        },
        "ableC-templating": {
          buildExtension("/melt-umn/ableC-templating")
        },
        "ableC-string": {
          buildExtension("/melt-umn/ableC-string")
        },
        "ableC-vector": {
          buildExtension("/melt-umn/ableC-vector")
        },
        "ableC-algebraic-data-types": {
          buildExtension("/melt-umn/ableC-algebraic-data-types")
        },
        "ableC-nonnull": {
          buildExtension("/melt-umn/ableC-nonnull")
        },
        "ableC-checkBounds": {
          buildExtension("/melt-umn/ableC-checkBounds")
        },
        "ableC-watch": {
          buildExtension("/melt-umn/ableC-watch")
        },
        "ableC-dimensionalAnalysis": {
          buildExtension("/melt-umn/ableC-dimensionalAnalysis")
        },
        "ableC_sample_projects": {
          buildExtension("/melt-umn/ableC_sample_projects")
        }
      )
    }

    /* TODO: use nailgun!
       sh ". ${params.SILVER_BASE}/support/nailgun/sv-nailgun"
       sh "sv-serve ableC.jar"
       sh "python testing/supertest.py ${params.SILVER_BASE}/support/nailgun/sv-call testing/tests/*"
    */
    stage ("Test") {
      dir("testing/expected-results") {
        withEnv(env) {
          sh "./runTests"
        }
      }
    }

    /* If we've gotten all this way with a successful build, don't take up disk space */
    sh "rm -rf generated/* || true"

  } catch (e) {
    currentBuild.result = 'FAILURE'
    throw e
  } finally {
    def previousResult = currentBuild.previousBuild?.result

    if (currentBuild.result == 'FAILURE') {
      notifyBuild(currentBuild.result)
    } else if (currentBuild.result == null &&
      previousResult && previousResult == 'FAILURE') {
      notifyBuild('BACK_TO_NORMAL')
    }
  }
}

/*
 * Try building the extension branch with the same name as the current branch,
 * or else fall back to building a default branch. */
def buildExtension(String extension, String defaultBranch = 'develop') {
    try {
//        echo("Trying to build ${extension}/${env.JOB_BASE_NAME}")
        build job: "${extension}/${env.JOB_BASE_NAME}", parameters:
            [[$class: 'StringParameterValue', name: 'SILVER_BASE', value: params.SILVER_BASE],
             [$class: 'StringParameterValue', name: 'ABLEC_BASE', value: WORKSPACE]]
    }
    catch (e) {
        echo("Falling back to build ${extension}/${defaultBranch} because ${extension}/${env.JOB_BASE_NAME} failed or does not exist")
        build job: "${extension}/${defaultBranch}", parameters:
            [[$class: 'StringParameterValue', name: 'SILVER_BASE', value: params.SILVER_BASE],
             [$class: 'StringParameterValue', name: 'ABLEC_BASE', value: WORKSPACE]]
    }
}

/* Slack / email notification
 * notifyBuild() author: fahl-design
 * https://bitbucket.org/snippets/fahl-design/koxKe */
def notifyBuild(String buildStatus = 'STARTED') {
  // build status of null means successful
  buildStatus = buildStatus ?: 'SUCCESSFUL'

  // Default values
  def colorName = 'RED'
  def colorCode = '#FF0000'
  def subject = "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
  def summary = "${subject} (${env.BUILD_URL})"
  def details = """<p>${buildStatus}: Job '${env.JOB_BASE_NAME} ${env.BRANCH_NAME} [${env.BUILD_NUMBER}]':</p>
    <p>Check console output at <a href='${env.BUILD_URL}'>${env.BUILD_URL}</a></p>"""

  // Override default values based on build status
  if (buildStatus == 'STARTED') {
    color = 'YELLOW'
    colorCode = '#FFFF00'
  } else if (buildStatus == 'SUCCESSFUL' || buildStatus == 'BACK_TO_NORMAL') {
    color = 'GREEN'
    colorCode = '#00FF00'
  } else {
    color = 'RED'
    colorCode = '#FF0000'
  }

  // Send notifications
  slackSend (color: colorCode, message: summary)

  emailext(
    subject: subject,
    mimeType: 'text/html',
    body: details,
    to: 'evw@umn.edu',
    recipientProviders: [[$class: 'CulpritsRecipientProvider']]
  )
}


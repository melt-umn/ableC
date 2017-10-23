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

    /* stages are pretty much just labels about what's going on */
    stage ("Build") {
      /* Clean Silver-generated files from previous builds in this workspace */
      sh "rm -rf generated/* || true"

      checkout scm

      /* Checkout sometimes(?) cleans out the workspace, so create this afterwards */
      sh "mkdir -p generated"

      /* env.PATH is the master's path, not the executor's */
      withEnv(["PATH=${params.SILVER_BASE}/support/bin/:${env.PATH}"]) {
        sh "./build -G generated --warn-all --warn-error"
      }
    }
    
    stage ("Tutorials") {
      dir("tutorials") {
        withEnv(["PATH=${params.SILVER_BASE}/support/bin/:${env.PATH}"]) {
          sh "./build-all"
        }
      }
    }

    stage ("Extensions") {
      parallel(
        "ableC-skeleton": {
          buildExtension("/melt-umn/ableC-skeleton", scm.branches[0].name)
        },
        "ableC-lib-skeleton": {
          buildExtension("/melt-umn/ableC-lib-skeleton", scm.branches[0].name)
        },
        /*
        "ableC-sqlite": {
//          build job: '/melt-umn/ableC-sqlite/develop', parameters:
          build job: "/melt-umn/ableC-sqlite/feature%2Ftype_qualifiers", parameters:
            [[$class: 'StringParameterValue', name: 'SILVER_BASE', value: params.SILVER_BASE],
             [$class: 'StringParameterValue', name: 'ABLEC_BASE', value: WORKSPACE]]
        },
        "ableC-condition-tables": {
//          build job: '/melt-umn/ableC-condition-tables/develop', parameters:
          build job: "/melt-umn/ableC-condition-tables/feature%2Ftype_qualifiers", parameters:
            [[$class: 'StringParameterValue', name: 'SILVER_BASE', value: params.SILVER_BASE],
             [$class: 'StringParameterValue', name: 'ABLEC_BASE', value: WORKSPACE]]
        },
        "ableC-interval": {
//          build job: '/melt-umn/ableC-interval/develop', parameters:
          build job: "/melt-umn/ableC-interval/feature%2Ftype_qualifiers", parameters:
            [[$class: 'StringParameterValue', name: 'SILVER_BASE', value: params.SILVER_BASE],
             [$class: 'StringParameterValue', name: 'ABLEC_BASE', value: WORKSPACE]]
        },
        "ableC-cilk": {
//          build job: '/melt-umn/ableC-cilk/develop', parameters:
          build job: "/melt-umn/ableC-cilk/feature%2Ftype_qualifiers", parameters:
            [[$class: 'StringParameterValue', name: 'SILVER_BASE', value: params.SILVER_BASE],
             [$class: 'StringParameterValue', name: 'ABLEC_BASE', value: WORKSPACE]]
        },
        "ableC-halide": {
//          build job: '/melt-umn/ableC-halide/develop', parameters:
          build job: "/melt-umn/ableC-halide/feature%2Ftype_qualifiers", parameters:
            [[$class: 'StringParameterValue', name: 'SILVER_BASE', value: params.SILVER_BASE],
             [$class: 'StringParameterValue', name: 'ABLEC_BASE', value: WORKSPACE]]
        },
        "ableC-closure": {
//          build job: '/melt-umn/ableC-closure/develop', parameters:
          build job: "/melt-umn/ableC-closure/feature%2Ftype_qualifiers", parameters:
            [[$class: 'StringParameterValue', name: 'SILVER_BASE', value: params.SILVER_BASE],
             [$class: 'StringParameterValue', name: 'ABLEC_BASE', value: WORKSPACE]]
        },
        "ableC-templating": {
//          build job: '/melt-umn/ableC-templating/develop', parameters:
          build job: "/melt-umn/ableC-templating/feature%2Ftype_qualifiers", parameters:
            [[$class: 'StringParameterValue', name: 'SILVER_BASE', value: params.SILVER_BASE],
             [$class: 'StringParameterValue', name: 'ABLEC_BASE', value: WORKSPACE]]
        },
        "ableC-string": {
//          build job: '/melt-umn/ableC-string/develop', parameters:
          build job: '/melt-umn/ableC-string/feature%2Ftype_qualifiers', parameters:
            [[$class: 'StringParameterValue', name: 'SILVER_BASE', value: params.SILVER_BASE],
             [$class: 'StringParameterValue', name: 'ABLEC_BASE', value: WORKSPACE]]
        },
        "ableC-vector": {
//          build job: '/melt-umn/ableC-vector/develop', parameters:
          build job: '/melt-umn/ableC-vector/feature%2Ftype_qualifiers', parameters:
            [[$class: 'StringParameterValue', name: 'SILVER_BASE', value: params.SILVER_BASE],
             [$class: 'StringParameterValue', name: 'ABLEC_BASE', value: WORKSPACE]]
        },
        "ableC-algebraic-data-types": {
//          build job: '/melt-umn/ableC-algebraic-data-types/develop', parameters:
          build job: '/melt-umn/ableC-algebraic-data-types/feature%2Ftype_qualifiers', parameters:
            [[$class: 'StringParameterValue', name: 'SILVER_BASE', value: params.SILVER_BASE],
             [$class: 'StringParameterValue', name: 'ABLEC_BASE', value: WORKSPACE]]
        },
        "ableC_sample_projects": {
//          build job: '/melt-umn/ableC_sample_projects/master', parameters:
          build job: '/melt-umn/ableC_sample_projects/feature%2Ftype_qualifiers', parameters:
            [[$class: 'StringParameterValue', name: 'SILVER_BASE', value: params.SILVER_BASE],
             [$class: 'StringParameterValue', name: 'ABLEC_BASE', value: WORKSPACE]]
        },
        "ableC-nonnull": {
//          build job: '/melt-umn/ableC-nonnull/develop', parameters:
          build job: '/melt-umn/ableC-nonnull/feature%2Ftype_qualifiers', parameters:
            [[$class: 'StringParameterValue', name: 'SILVER_BASE', value: params.SILVER_BASE],
             [$class: 'StringParameterValue', name: 'ABLEC_BASE', value: WORKSPACE]]
        },
        "ableC-checkBounds": {
//          build job: '/melt-umn/ableC-checkBounds/develop', parameters:
          build job: '/melt-umn/ableC-checkBounds/feature%2Ftype_qualifiers', parameters:
            [[$class: 'StringParameterValue', name: 'SILVER_BASE', value: params.SILVER_BASE],
             [$class: 'StringParameterValue', name: 'ABLEC_BASE', value: WORKSPACE]]
        },
        "ableC-watch": {
          build job: '/melt-umn/ableC-watch/develop', parameters:
            [[$class: 'StringParameterValue', name: 'SILVER_BASE', value: params.SILVER_BASE],
             [$class: 'StringParameterValue', name: 'ABLEC_BASE', value: WORKSPACE]]
        },
        "ableC-dimensionalAnalysis": {
          build job: '/melt-umn/ableC-dimensionalAnalysis/develop', parameters:
            [[$class: 'StringParameterValue', name: 'SILVER_BASE', value: params.SILVER_BASE],
             [$class: 'StringParameterValue', name: 'ABLEC_BASE', value: WORKSPACE]]
        }*/
      )
    }

    /* TODO: use nailgun!
       sh ". ${params.SILVER_BASE}/support/nailgun/sv-nailgun"
       sh "sv-serve ableC.jar"
       sh "python testing/supertest.py ${params.SILVER_BASE}/support/nailgun/sv-call testing/tests/*"
    */
    stage ("Test") {
      dir("testing/expected-results") {
        withEnv(["PATH=${params.SILVER_BASE}/support/nailgun/:${env.PATH}"]) {
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

def buildExtension(String extension, String branch = 'develop') {
    try {
        build job: "$extension/$branch", parameters:
            [[$class: 'StringParameterValue', name: 'SILVER_BASE', value: params.SILVER_BASE],
             [$class: 'StringParameterValue', name: 'ABLEC_BASE', value: WORKSPACE]]
    }
    catch (e) {
        build job: "$extension/develop", parameters:
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


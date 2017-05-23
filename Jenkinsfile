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


/* stages are pretty much just labels about what's going on */

stage ("Build") {

  /* a node allocates an executor to actually do work */
  node {
    checkout scm

    /* env.PATH is the master's path, not the executor's */
    withEnv(["PATH=${SILVER_BASE}/support/bin/:${env.PATH}"]) {
      sh "./build --warn-all"
    }
  }

}

stage ("Test") {
  node {
    sh "python testing/supertest.py -positive-only ableC.jar testing/tests/* |diff testing/expectedResults/positive /dev/stdin"
  }

  node {
    sh "python testing/supertest.py -negative-only ableC.jar testing/tests/* |diff testing/expectedResults/negative /dev/stdin"
  }

  node {
    sh "python testing/supertest.py -neutral ableC.jar testing/tests/* |diff testing/expectedResults/neutral /dev/stdin"
  }
}


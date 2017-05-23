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

stage ("Extensions") {
  parallel(
    /* algebraicDataTypes */
    node {
      checkout([ $class: 'GitSCM',
                 branches: [[name: '*/master']],
                 doGenerateSubmoduleConfigurations: false,
                 extensions: [
                   [ $class: 'RelativeTargetDirectory',
                     relativeTargetDir: 'edu.umn.cs.melt.exts.ableC.algebraicDataTypes']
                 ],
                 submoduleCfg: [],
                 userRemoteConfigs: [
                   [url: 'https://github.com/melt-umn/edu.umn.cs.melt.exts.ableC.algebraicDataTypes.git']
                 ]
               ])

      /* env.PATH is the master's path, not the executor's */
      withEnv(["PATH=${SILVER_BASE}/support/bin/:${env.PATH}"]) {
        /* build */
        sh "cd edu.umn.cs.melt.exts.ableC.algebraicDataTypes/artifact && ./build.sh"

        /* modular analyses */
        def mdir = "edu.umn.cs.melt.exts.ableC.algebraicDataTypes/modular_analyses"
        sh "cd ${mdir}/determinism && ./run.sh"
        sh "cd ${mdir}/well_definedness && ./run.sh"
      }
    }
  )
}

/* TODO: use nailgun!
   sh ". ${SILVER_BASE}/support/nailgun/sv-nailgun"
   sh "sv-serve ableC.jar"
   sh "python testing/supertest.py ${SILVER_BASE}/support/nailgun/sv-call testing/tests/*"
*/
stage ("Test") {
  node {
    sh "python testing/supertest.py -positive-only ableC.jar testing/tests/* |diff testing/expected-results/positive /dev/stdin"
  }

  node {
    sh "python testing/supertest.py -negative-only ableC.jar testing/tests/* |diff testing/expected-results/negative /dev/stdin"
  }

  node {
    sh "python testing/supertest.py -neutral ableC.jar testing/tests/* |diff testing/expected-results/neutral /dev/stdin"
  }
}


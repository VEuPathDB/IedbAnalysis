#!/usr/bin/env nextflow

//---------------------------------------
// include the RNA seq workflow
//---------------------------------------

include { epitopesBlast } from  './modules/epitopesBlast.nf'

//======================================

  if(!params.refFasta) {
    throw new Exception("Missing parameter params.refFasta")
  }
  if(!params.peptidesTab) {
    throw new Exception("Missing parameter params.peptidesTab")
  }
  
  if(!params.taxon) {
    throw new Exception("Missing parameter params.taxon")
  }
  if(!params.peptideMatchResults) {
    throw new Exception("Missing parameter params.peptideMatchResults")
  }
  if(!params.peptidesFilteredBySpeciesFasta) {
    throw new Exception("Missing parameter params.peptidesFilteredBySpeciesFasta")
  }
  if(!params.peptideMatchBlastCombinedResults) {
    throw new Exception("Missing parameter params.peptideMatchBlastCombinedResults")
  }
  if(!params.chunkSize) {
    throw new Exception("Missing parameter params.chuckSize")
  } 
  if(!params.results) {
    throw new Exception("Missing parameter params.results")
  } 

refFasta = Channel.fromPath(params.refFasta, checkIfExists:true).splitFasta( by: params.chuckSize, file: true )

peptidesTab = Channel.fromPath(params.peptidesTab, checkIfExists: true).first()

workflow {
    epitopesBlast(refFasta, peptidesTab)
}


